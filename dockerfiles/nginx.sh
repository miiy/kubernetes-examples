#!/bin/sh

docker run --name nginx -d --restart=always \
  -p 80:80 -p 443:443 \
  -v /home/www/data/nginx/config/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /home/www/data/nginx/config/conf.d/:/etc/nginx/conf.d:ro \
  -v /home/www/data/nginx/config/ssl/:/etc/nginx/ssl:ro \
  -v /home/www/data/log/nginx/:/var/log/nginx:rw \
  -v /home/www/data/www/:/data/www/:ro \
  --add-host=host.docker.internal:host-gateway \
  --net frontend \
  nginx:1.25
