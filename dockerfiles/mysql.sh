#!/bin/sh

sudo docker run --name mysql -d --restart=always \
  -p 127.0.0.1:3306:3306 \
  -v /home/www/appdata/mysql/data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=your@paas \
  --net backend mysql:8
