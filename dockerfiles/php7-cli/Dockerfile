FROM php:7.4-cli

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
    libmagickcore-dev libmagickwand-dev

    # opcache
RUN docker-php-ext-enable opcache \
    # mysql pgsql pcntl shomp soap ldap zip bcmath exif
    && docker-php-ext-install -j $(nproc) mysqli pdo_mysql pgsql pdo_pgsql pcntl shmop soap ldap zip bcmath exif \
    # gd
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j $(nproc) gd

# ext
RUN pecl install redis xdebug memcached mongodb amqp yaml swoole yaf grpc xlswriter apcu imagick \
    && docker-php-ext-enable redis xdebug memcached mongodb amqp yaml swoole yaf grpc xlswriter apcu imagick \
    # clean
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /tmp/pear
