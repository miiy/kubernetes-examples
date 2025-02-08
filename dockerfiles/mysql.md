# mysql

```bash
sudo docker run --name mysql -d --restart=always \
  -v /data/mysql/data:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=your@paas \
  --net backend mysql:8.4.3
```
