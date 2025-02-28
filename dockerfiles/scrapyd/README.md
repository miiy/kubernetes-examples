# scrapyd

<https://scrapyd.readthedocs.io/en/latest/deploy.html>

## Run

/path/to/scrapyd/config/scrapyd.conf

```
[scrapyd]
bind_address      = 0.0.0.0
http_port         = 6800
logs_dir          = /var/lib/scrapyd/logs
items_dir         = /var/lib/scrapyd/items
dbs_dir           = /var/lib/scrapyd/dbs
eggs_dir          = /src/eggs
```

```bash
sudo docker run --name scrapyd -d --restart=unless-stopped \
    -v /path/to/scrapyd/config/:/etc/scrapyd/ \
    -v /path/to/scrapyd/data/:/var/lib/scrapyd/ \
    --network backend \
    scrapyd:latest
```

