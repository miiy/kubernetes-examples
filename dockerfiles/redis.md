
## docker

```bash
docker run --name redis -d --restart=always \
-v /home/user/data/redis/data:/data \
--net backend -d redis:7.2.6 \
redis-server --save 60 1 --loglevel warning
```

```bash
docker run --name redis -d --restart=always \
-p 127.0.0.1:6379:6379 \
-v /home/user/data/redis/conf:/usr/local/etc/redis \
-v /home/user/data/redis/data:/data \
--net backend -d redis:7.2.6 \
redis-server /usr/local/etc/redis/redis.conf
```

redis-cli

```bash
docker run -it --network backend --rm redis:7 redis-cli -h [IP]
```

## source

```bash
cd /usr/local/src
wget https://download.redis.io/releases/redis-6.2.0.tar.gz
tar -zxvf redis-6.2.0.tar.gz redis-6.2.0/
mv redis-6.2.0 /usr/local/
cd /usr/local/
ln -s redis-6.2.0/ redis
make
make PREFIX=/usr/local/redis install
```
