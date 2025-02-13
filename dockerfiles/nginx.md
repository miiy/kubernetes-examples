#!/bin/sh

```bash
docker run --name nginx -d --restart=always \
  -p 80:80 -p 443:443 \
  -v /home/debian/data/nginx/config/nginx.conf:/etc/nginx/nginx.conf:ro \
  -v /home/debian/data/nginx/config/conf.d/:/etc/nginx/conf.d:ro \
  -v /home/debian/data/nginx/config/ssl/:/etc/nginx/ssl:ro \
  -v /home/debian/data/nginx/log/:/var/log/nginx:rw \
  -v /home/debian/data/www/:/data/www/:ro \
  --add-host=host.docker.internal:host-gateway \
  --net frontend \
  nginx:1.27-bookworm
```
