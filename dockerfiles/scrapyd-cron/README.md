# scrapyd-cron

## build

```bash
docker build -t scrapyd-cron:v0.1.0 .
```

## run

```bash
docker run --name scrapyd-cron -d --restart=unless-stopped \
    -v /home/debian/data/scrapyd-cron/crontabs/root:/var/spool/cron/crontabs/root \
    --network backend \
    scrapyd-cron:v0.1.0
```