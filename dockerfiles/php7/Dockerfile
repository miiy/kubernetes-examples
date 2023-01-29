ARG DOCKER_PHP_MODE

FROM php:7.4-${DOCKER_PHP_MODE}

RUN cat /etc/apt/sources.list \
    && sed -i "s/deb.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
    && sed -i "s/security.debian.org/mirrors.tuna.tsinghua.edu.cn/g" /etc/apt/sources.list \
    && echo "\n" \
    && cat /etc/apt/sources.list

RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini" \
    && echo "expose_php = Off" >> "$PHP_INI_DIR/conf.d/docker-php-common.ini"

RUN apt-get update && apt-get install -y \
    # common
    vim git zip unzip \
    # postgresql
    postgresql-server-dev-13 \
    # soap
    libxml2-dev \
    # ldap
    libldap2-dev\
    # zip
    libzip-dev \
    # gd
    libfreetype6-dev libfreetype6-dev libjpeg62-turbo-dev libpng-dev \
    # memcached
    libmemcached-dev \
    # amqp
    librabbitmq-dev \
    # yaml
    libyaml-dev \
    # imagick
    libmagickcore-dev libmagickwand-dev \
    && rm -rf /var/lib/apt/lists/*

    # opcache
RUN docker-php-ext-enable opcache \
    # mysql pgsql pcntl shomp soap ldap zip bcmath exif
    && docker-php-ext-install -j $(nproc) mysqli pdo_mysql pgsql pdo_pgsql pcntl shmop soap ldap zip bcmath exif \
    # gd
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j $(nproc) gd

# ext
#RUN pecl install redis xdebug memcached mongodb amqp yaml swoole yaf grpc xlswriter apcu imagick \
#    && docker-php-ext-enable redis xdebug memcached mongodb amqp yaml swoole yaf grpc xlswriter apcu imagick \
#    # clean
#    && rm -rf /var/lib/apt/lists/* \
#    && rm -rf /tmp/pear
COPY ./phpext /tmp/phpext

RUN iext="" \
    && for ext in "redis" "xdebug" "memcached" "mongodb" "amqp" "yaml" "swoole" "yaf" "grpc" "xlswriter" "apcu" "imagick"; do \
        if [ -f /tmp/phpext/$ext.tgz ]; then \
            pecl install /tmp/phpext/$ext.tgz; \
            rm -f /tmp/phpext/$ext.tgz; \
        else \
            echo -e "\033[31mWARNING: $ext not existed.\033[0m"; \
            pecl install $ext; \
        fi ; \
        docker-php-ext-enable $ext; \
        iext="${iext} $ext"; \
    done \
    && echo -e "\033[32mINFO: $iext installed.\033[0m" \
    # clean
    && rm -rf /tmp/pear \
    && rm -rf /tmp/phpext

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/
