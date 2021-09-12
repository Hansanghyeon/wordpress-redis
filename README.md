## What is this?

이것은 추가 및 기타 확장이 포함된 PHP 8.0 FPM 기본이미 오피셜 워드프레스입니다.

웹 서버가 없고 대신 포트 9000에서 수신하는 PHP-FPM이 있습니다. 작동하려면 nginx와 같은 웹 서버가 이 포트로 요청을 업스트림으로 보내야 합니다.

## What's included:

* PHP extensions (additional to default PHP installation):
  * `redis`
  * `imagick`
  * `libsodium`
  * `exif`
  * `gettext`
  * `intl`
  * `mcrypt`
  * `socket`
  * `zip`

## docker env 추가

해당 env를 추가하는 방법을 많이 고민해봤다. 여러가지 예시도 찾아보고 [5.8.0-php8.0-fpm-alpine](https://github.com/docker-library/wordpress/tree/e98fe75c5a41e2d3f3c4d89f3e6b15e62638147c/latest/php8.0/fpm-alpine) 해당 `Dockerfile`을 토대로 커스텀하게 만들려고 시도도 해봤지만 어째선지

```
Starting wordpress-php80-docker-xdebug30-vscode_wordpress_1 ... error

ERROR: for wordpress-php80-docker-xdebug30-vscode_wordpress_1  Cannot start service wordpress: OCI runtime create failed: container_linux.go:380: starting container process caused: exec: "docker-entrypoint.sh": executable file not found in $PATH: unknown
```

어떻게 손쓸 방법이 생각나지 않아서 이부분은 포기하고 자료를 찾아보는 도중에

https://github.com/docker-library/wordpress/issues/147, https://github.com/docker-library/wordpress/pull/142

해당 issue와 PR을 보고 `wp-config.php`에 환경변수를 추가하는 방법을 사용

- WORDPRESS_REDIS_HOST (default: redis)
- WORDPRESS_REDIS_PORT (default: 6379)

```yaml
services:
 wordpress_fpm:
    image: docker pull ghcr.io/hansanghyeon/docker-wordpress-redis:latest
    environment:
      WORDPRESS_CONFIG_EXTRA: |
        /* Redis */
        define('WP_REDIS_HOST', getenv_docker('WORDPRESS_REDIS_HOST', 'redis'));
        define('WP_REDIS_PORT', getenv_docker('WORDPRESS_REDIS_PORT', 6379));
```