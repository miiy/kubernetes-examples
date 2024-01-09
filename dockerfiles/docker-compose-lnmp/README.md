# Docker LNMP Environment

## Services

- nginx

- mysql

- redis

- php-fpm

- php-cli

  - composer

  - phpunit

  - supervisor

## Setting

```bash
cp .env.example .env
```

php7

```text
PHP_VERSION=7
PHP_SRC_DIR=php7
```
or

```text
PHP_VERSION=7.3
PHP_SRC_DIR=php7
```

php5

```text
PHP_VERSION=5
PHP_SRC_DIR=php5
```

download php extension

```bash
chmod +x phpext-download.sh
./phpext-download.sh
```

## Start

```bash
docker-compose up -d
```

## Stop

```bash
docker-compose stop
```
