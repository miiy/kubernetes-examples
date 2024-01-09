ARG DOCKER_PHP_VERSION

ARG DOCKER_PHP_MODE

FROM php:${DOCKER_PHP_VERSION}-${DOCKER_PHP_MODE}-alpine

# https://developer.aliyun.com/mirror/alpine
ARG DOCKER_CHANGE_ALPINE_REPOSITORIES
RUN if [ ${DOCKER_CHANGE_ALPINE_REPOSITORIES} = "true" ]; then \
        cat /etc/apk/repositories \
        && cp /etc/apk/repositories /etc/apk/repositories.bak \
        && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories.bak \
        && cp /etc/apk/repositories.bak /etc/apk/repositories \
        && cat /etc/apk/repositories \
        ; \
    fi

RUN apk add --no-cache \
    # postgresql
    postgresql-dev \
    # soap
    libxml2-dev \
    # ldap
    openldap-dev \
    # gd
    freetype-dev libjpeg-turbo-dev libpng-dev \
    # memcached
    libmemcached-dev \
    # amqp
    rabbitmq-c-dev \
    # yaml
    yaml-dev \
    # mcrypt
    libmcrypt-dev \
    # zip
    libzip-dev \
    # imagick
    imagemagick imagemagick-dev \
    # php.ini
    && cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    # ext
    && \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
        docker-php-ext-install -j $(nproc) mysql mysqli pdo_mysql pgsql pdo_pgsql mcrypt pcntl shmop soap ldap zip gd; \
    else \
        docker-php-ext-install -j $(nproc) mysqli pdo_mysql pgsql pdo_pgsql pcntl shmop soap ldap zip gd; \
    fi \
    # opcache
    && docker-php-ext-enable opcache \
    # bcmath
    && docker-php-ext-enable --enable-bcmath

ARG DOCKER_PHP_SRC_DIR
COPY ./src/${DOCKER_PHP_SRC_DIR} /tmp/src

ARG DOCKER_PHP_MODE
RUN iext=""; \
    # sh unsupport array
    for ext in "redis" "memcached" "mongodb" "amqp" "yaml" "xdebug" "swoole" "yaf" "mcrypt" "apcu" "imagick"; do \
        if [ -f /tmp/src/$ext.tgz ]; then \
            mkdir -p /tmp/src/$ext \
            && tar -xf /tmp/src/$ext.tgz -C /tmp/src/$ext --strip-components=1 \
            && docker-php-ext-configure /tmp/src/$ext \
            && docker-php-ext-install -j $(nproc) /tmp/src/$ext \
            && rm /tmp/src/$ext.tgz \
            && rm -r /tmp/src/$ext \
            && iext="${iext} $ext" \
            ; \
        else \
            echo -e "\033[31mWARNING: $ext not existed.\033[0m"; \
        fi \
    done \
    && echo -e "\033[32mINFO: $iext installed.\033[0m"; \
    if [ ${DOCKER_PHP_MODE} = "cli" ]; then \
        apk add --no-cache \
        # composer
        git zip unzip \
        # supervisor
        supervisor \
        # vim
        vim \
        && chmod +x /tmp/src/composer.phar \
        && mv /tmp/src/composer.phar /usr/local/bin/composer \
        && chmod +x /tmp/src/phpunit.phar \
        && mv /tmp/src/phpunit.phar /usr/local/bin/phpunit \
        ; \
    fi \
    && rm -rf /tmp/src

COPY ./cli-entrypoint.sh /usr/local/bin/
RUN if [ ${DOCKER_PHP_MODE} = "cli" ]; then \
        chmod +x /usr/local/bin/cli-entrypoint.sh; \
    else \
        rm /usr/local/bin/cli-entrypoint.sh; \
    fi
