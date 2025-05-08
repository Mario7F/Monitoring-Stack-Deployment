#!/bin/bash

echo "Install Grafana Server”
sudo dnf install -y http://mirror.linuxtrainingacademy.com/grafana/grafana-7.2.0-1.x86_64.rpm
sudo systemctl start grafana-server
sudo systemctl enable grafana-server
