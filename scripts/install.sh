#!/bin/bash
set -e

echo "[*] Starting Monitoring Stack Deployment..."

sudo apt update && sudo apt upgrade -y
sudo apt install -y wget curl tar

# Install Prometheus
cd /opt
sudo useradd --no-create-home --shell /bin/false prometheus
sudo mkdir /etc/prometheus /var/lib/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.50.1/prometheus-2.50.1.linux-amd64.tar.gz
tar xvf prometheus-2.50.1.linux-amd64.tar.gz
cd prometheus-2.50.1.linux-amd64
sudo cp prometheus promtool /usr/local/bin/
sudo cp -r consoles console_libraries /etc/prometheus
sudo cp ../config/prometheus.yml /etc/prometheus/prometheus.yml

sudo bash -c 'cat > /etc/systemd/system/prometheus.service' << EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
ExecStart=/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus

[Install]
WantedBy=default.target
EOF

sudo systemctl daemon-reexec
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Install Node Exporter
cd /opt
wget https://github.com/prometheus/node_exporter/releases/download/v1.8.0/node_exporter-1.8.0.linux-amd64.tar.gz
tar xvf node_exporter-1.8.0.linux-amd64.tar.gz
sudo cp node_exporter-1.8.0.linux-amd64/node_exporter /usr/local/bin/
sudo useradd -rs /bin/false node_exporter

sudo bash -c 'cat > /etc/systemd/system/node_exporter.service' << EOF
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=default.target
EOF

sudo systemctl daemon-reexec
sudo systemctl start node_exporter
sudo systemctl enable node_exporter

# Install Grafana
sudo apt install -y apt-transport-https software-properties-common
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt update
sudo apt install -y grafana
sudo systemctl enable grafana-server
sudo systemctl start grafana-server

echo "[✓] Monitoring stack installed! Access Prometheus at :9090 and Grafana at :3000"
