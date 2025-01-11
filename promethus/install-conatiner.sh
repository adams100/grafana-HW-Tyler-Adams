#!/bin/bash

sudo yum install podman -y
sudo podman pull docker.io/prom/prometheus:latest
sudo podman run -d -p 9090:9090 -v ./pki/:/etc/prometheus/certs:z -v ./web-config.yml:/etc/prometheus/web-config.yml:z --name prom prom/prometheus --web.config.file=/etc/prometheus/web-config.yml --config.file=/etc/prometheus/prometheus.yml
