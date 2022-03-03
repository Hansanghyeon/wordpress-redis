FROM wordpress:5.9.1-php8.1-apache

# Install Redis
RUN apt-get update && pecl install redis-5.3.4 php5-redis && docker-php-ext-enable redis

# WP CLI install
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
COPY config.yml /root/.wp-cli/config.yml
RUN echo "alias wp='wp --allow-root'" >> /root/.bashrc