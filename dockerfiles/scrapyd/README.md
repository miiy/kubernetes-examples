# scrapyd

<https://scrapyd.readthedocs.io/en/latest/deploy.html>

## Run

/path/to/scrapyd/config/scrapyd.conf

```
[scrapyd]
bind_address      = 0.0.0.0
http_port         = 6800
```

```bash
sudo docker run --name scrapyd -d --restart=unless-stopped \
    -v /path/to/scrapyd/config/:/etc/scrapyd/ \
    --network backend \
    scrapyd:latest
```

