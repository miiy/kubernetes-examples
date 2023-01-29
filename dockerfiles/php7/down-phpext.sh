#!/bin/bash

download() {
    path=./phpext

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


function extDown()
{
    # https://pecl.php.net/package/redis
    download redis.tgz https://pecl.php.net/get/redis-5.3.7.tgz
    # https://pecl.php.net/package/xdebug
    download xdebug.tgz https://pecl.php.net/get/xdebug-3.1.6.tgz
    # https://pecl.php.net/package/memcached
    download memcached.tgz https://pecl.php.net/get/memcached-3.2.0.tgz
    # https://pecl.php.net/package/mongodb
    download mongodb.tgz https://pecl.php.net/get/mongodb-1.15.0.tgz
    # https://pecl.php.net/package/amqp
    download amqp.tgz https://pecl.php.net/get/amqp-1.11.0.tgz
    # https://pecl.php.net/package/yaml
    download yaml.tgz https://pecl.php.net/get/yaml-2.2.2.tgz
    # https://pecl.php.net/package/APCu
    download apcu.tgz https://pecl.php.net/get/apcu-5.1.22.tgz
    # https://pecl.php.net/package/swoole
    download swoole.tgz https://pecl.php.net/get/swoole-4.8.12.tgz
    # https://pecl.php.net/package/yaf
    download yaf.tgz https://pecl.php.net/get/yaf-3.3.5.tgz
    # https://pecl.php.net/package/gRPC
    download grpc.tgz https://pecl.php.net/get/grpc-1.51.1.tgz
    # https://pecl.php.net/package/xlswriter
    download xlswriter.tgz https://pecl.php.net/get/xlswriter-1.5.2.tgz
    # https://pecl.php.net/package/APCu
    download apcu.tgz https://pecl.php.net/get/apcu-5.1.22.tgz
    # https://pecl.php.net/package/imagick
    download imagick.tgz https://pecl.php.net/get/imagick-3.7.0.tgz
}

extDown