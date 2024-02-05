#!/bin/bash

# https://prometheus.io/docs/guides/cadvisor/

docker run -d --name node-exporter --restart=always \
    -v "/proc:/host/proc:ro" \
    -v "/sys:/host/sys:ro" \
    -v "/:/rootfs:ro" \
    --net backend \
    prom/node-exporter:v1.7.0

# -p 127.0.0.1:9100:9100 \
