# node-exporter-pusher

## build

```bash
docker build . -t node-exporter-pusher
```

## run

```bash
docker run --name node-exporter-pusher -d --restart=always \
    -v /home/debian/data/node-exporter-pusher/.env:/root/.env \
    --network backend \
    node-exporter-pusher
```
