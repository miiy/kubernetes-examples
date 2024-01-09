#!/bin/sh

docker run --name redis -d --restart=always \
-p 127.0.0.1:6379:6379 \
-v /home/appdata/redis/conf:/usr/local/etc/redis \
-v /home/appdata/redis/data:/data \
--net backend -d redis:7 \
redis-server /usr/local/etc/redis/redis.conf

# redis-cli
# docker run -it --network backend --rm redis:7 redis-cli -h [IP]

