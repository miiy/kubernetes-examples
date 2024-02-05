#!/bin/bash

docker run -d --name=grafana --restart=always \
    --user "$(id -u)" \
    -v /home/appdata/grafana/data:/var/lib/grafana \
    --net frontend \
    grafana/grafana:10.3.1

# -p 127.0.0.1:3000:3000 \

docker network connect backend grafana