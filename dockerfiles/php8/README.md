## build

```bash
$ ./down-phpext.sh
# fpm
$ docker build -t registry.cn-hangzhou.aliyuncs.com/ahub/php:8.2-fpm \
    --build-arg DOCKER_PHP_MODE=fpm \
    .
# cli
$ docker build -t registry.cn-hangzhou.aliyuncs.com/ahub/php:8.2-cli \
    --build-arg DOCKER_PHP_MODE=cli \
    .
```

## push

```bash
docker push registry.cn-hangzhou.aliyuncs.com/ahub/php:8.2-fpm
docker push registry.cn-hangzhou.aliyuncs.com/ahub/php:8.2-cli
```