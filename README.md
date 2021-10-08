## What is this?

이것은 추가 및 기타 확장이 포함된 `wordpress:php8.0-apache` 기본이미 오피셜 워드프레스입니다.

## What's included:

* PHP extensions (additional to default PHP installation):
  * `redis`
  * `php5-redis`

## TL;DR

```yaml
services:
 wordpress_fpm:
    image: ghcr.io/hansanghyeon/wordpress-redis:latest
    environment:
      WORDPRESS_CONFIG_EXTRA: |
        /* Redis */
        define('WP_REDIS_HOST', getenv_docker('WORDPRESS_REDIS_HOST', 'redis'));
        define('WP_REDIS_PORT', getenv_docker('WORDPRESS_REDIS_PORT', 6379));
```
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
    image: ghcr.io/hansanghyeon/wordpress-redis:latest
    environment:
      WORDPRESS_CONFIG_EXTRA: |
        /* Redis */
        define('WP_REDIS_HOST', getenv_docker('WORDPRESS_REDIS_HOST', 'redis'));
        define('WP_REDIS_PORT', getenv_docker('WORDPRESS_REDIS_PORT', 6379));
```

## wordpress test result

<img width="952" alt="스크린샷 2021-10-08 오후 1 30 10" src="https://user-images.githubusercontent.com/42893446/136500291-e450d26d-9183-4cfb-9fb5-7fafa51bc0fa.png">
<img width="952" alt="스크린샷 2021-10-08 오후 1 30 06" src="https://user-images.githubusercontent.com/42893446/136500303-aa14c506-e6d8-4905-8db3-1dd92e2ce1cf.png">



## 왜 nginx를 사용하지 않았나?

필자는 traefik을 이용하여 서비스를 배포한다. 그런데 중간에 traefik > nginx > wordpress-fpm으로 할때 nginx에서 설정해야할 설정값들을 설정하기에 매번 그래야한다는 생각으로 좀더 간편한 방법 최소한의 개발을 방향으로 잡았기에 해당 커스텀 이미지만을 사용해서 완료할 수 있도록 하려고 traefik > wordpress-apache로 만들었다.
