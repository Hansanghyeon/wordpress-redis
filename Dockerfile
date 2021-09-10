FROM wordpress:php8.0-fpm

RUN apt-get update && apt-get install -y \
  libicu-dev \
  libmcrypt-dev \
  libmagickwand-dev \
  libsodium-dev \
  libzip-dev \
  --no-install-recommends && rm -r /var/lib/apt/lists/* && pecl install redis-5.3.4 imagick-3.5.1 libsodium-2.0.21 && docker-php-ext-enable redis imagick sodium && docker-php-ext-install -j$(nproc) exif gettext intl sockets zip

RUN sed -i '' '/\/\* Add any custom values between this line and the "stop editing" line. \*\// i\
/* Add any custom values between this line and the "stop editing" line. */\
\
define( 'WP_REDIS_HOST', getenv_docker('WORDPRESS_REDIS_HOST', 'redis') );\
define( 'WP_REDIS_PORT', getenv_docker('WORDPRESS_REDIS_PORT', 6379) );\
\
' /usr/src/wordpress/wp-config.php
