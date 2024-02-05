#!/bin/sh

docker run --name prometheus -d --restart=always \
    --user "$(id -u)" \
    -v /home/appdata/prometheus/conf/prometheus.yml:/etc/prometheus/prometheus.yml \
    -v /home/appdata/prometheus/data:/prometheus \
    --net backend \
    prom/prometheus:v2.49.1

# --user 1000
# open /prometheus/queries.active: permission denied
# https://github.com/prometheus/prometheus/issues/5976

# -p 127.0.0.1:9090:9090 \
