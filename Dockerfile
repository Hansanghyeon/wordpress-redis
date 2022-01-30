FROM wordpress:5.9.0-php8.1-apache

RUN apt-get update && pecl install redis-5.3.4 php5-redis && docker-php-ext-enable redis
