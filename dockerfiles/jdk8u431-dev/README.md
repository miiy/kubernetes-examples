# jdk8u431-dev

## Build image

```bash
docker build -t jdk8u431-dev .
```

## run

```bash
docker run --name jdk8u431-dev -d --restart=always  \
  -v /data/jdk8u431-dev.test/.ssh:/root/.ssh \
  -v /data/jdk8u431-dev.test/app:/app \
  -p 1222:22 \
  jdk8u431-dev
```
