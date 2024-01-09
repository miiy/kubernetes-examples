#!/bin/bash

download() {
    if [ ! -d $path ]; then
        mkdir -p $path
        echo "$path not existed, created."
    fi

    if [ -f $path/$1 ]; then
        echo "$1 existed."
    else
        echo "$1 not existed, begin to download..."
        curl -fsSL $2 -o $path/$1;
        if [ $? -eq 0 ]; then
            echo "download $1 successed.";
        else
            echo -e "\033[31mError: download $1 failed.\033[0m"
            if [ -f $path/$1 ]; then
                rm $path/$1
            fi
            return 1;
        fi
    fi
    return 0
}

function menu()
{
    clear
    echo "1.php7"
    echo "2.php5"
    read -p "Enter your choice: " select

    case $select in
        1)
            path=./services/php/src/php7
            download amqp.tgz https://pecl.php.net/get/amqp-1.9.4.tgz
            download apcu.tgz https://pecl.php.net/get/apcu-5.1.18.tgz
            download imagick.tgz https://pecl.php.net/get/imagick-3.4.4.tgz
            download memcached.tgz https://pecl.php.net/get/memcached-3.1.5.tgz
            download mcrypt.tgz https://pecl.php.net/get/mcrypt-1.0.3.tgz
            download mongodb.tgz https://pecl.php.net/get/mongodb-1.7.2.tgz
            download redis.tgz https://pecl.php.net/get/redis-5.1.1.tgz
            download swoole.tgz https://pecl.php.net/get/swoole-4.4.15.tgz
            download xdebug.tgz https://pecl.php.net/get/xdebug-2.9.2.tgz
            download yaf.tgz https://pecl.php.net/get/yaf-3.0.9.tgz
            download yaml.tgz https://pecl.php.net/get/yaml-2.0.4.tgz

            download phpunit.phar https://phar.phpunit.de/phpunit-9.phar
            download composer.phar https://getcomposer.org/download/1.9.3/composer.phar
            ;;
        2)
            path=./services/php/src/php5
            download amqp.tgz https://pecl.php.net/get/amqp-1.9.4.tgz
            download apcu.tgz https://pecl.php.net/get/apcu-4.0.11.tgz # latest
            download imagick.tgz https://pecl.php.net/get/imagick-3.4.4.tgz
            download memcached.tgz https://pecl.php.net/get/memcached-2.2.0.tgz # latest
            download mongodb.tgz https://pecl.php.net/get/mongodb-1.6.0.tgz # latest
            download redis.tgz https://pecl.php.net/get/redis-4.3.0.tgz # latest
            download swoole.tgz https://pecl.php.net/get/swoole-1.10.5.tgz # latest
            download xdebug.tgz https://pecl.php.net/get/xdebug-2.5.5.tgz # latest
            download yaf.tgz https://pecl.php.net/get/yaf-2.3.5.tgz # latest
            download yaml.tgz https://pecl.php.net/get/yaml-1.3.2.tgz # latest

            download phpunit.phar https://phar.phpunit.de/phpunit-5.phar
            download composer.phar https://getcomposer.org/download/1.9.3/composer.phar
            ;;
        *)
            echo "default"
            ;;
    esac
}

menu
