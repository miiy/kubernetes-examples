FROM registry.cn-hangzhou.aliyuncs.com/ahub/php:8.2-fpm

WORKDIR /var/www/html

# https://getcomposer.org/download/
# php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
# && php -r "if (hash_file('sha384', 'composer-setup.php') === '55ce33d7678c5a611085589f1f3ddf8b3c52d662cd01d4ba75c0ee0459970c2200a51f492d557530c71c15d8dba01eae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
RUN php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
    && php -r "unlink('composer-setup.php');" \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/

#COPY --chown=www-data:www-data . /var/www/html
RUN composer create-project laravel/laravel .

# https://laravel.com/docs/9.x/deployment
RUN composer install --optimize-autoloader --no-dev \
    && php artisan config:cache \
    && php artisan route:cache \
    && php artisan view:cache \
    && chown -R www-data:www-data /var/www/html \
    && rm -rf ~/.composer/cache/
