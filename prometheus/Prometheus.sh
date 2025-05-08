#!/bin/bash

echo "Prometheus Server”

sudo dnf install -y http://mirror.linuxtrainingacademy.com/grafana/influxdb-1.8.2.x86_64.rpm
sudo systemctl start influxdb
sudo systemctl enable influxdb
sudo dnf install -y http://mirror.linuxtrainingacademy.com/grafana/telegraf-1.15.3-1.x86_64.rpm
sudo systemctl start telegraf
sudo systemctl enable telegraf

echo "Access Prometheus at :9090"
