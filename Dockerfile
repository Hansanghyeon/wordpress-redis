FROM wordpress:php8.0-apache

RUN apt-get update && pecl install redis-5.3.4 php5-redis && docker-php-ext-enable redis
