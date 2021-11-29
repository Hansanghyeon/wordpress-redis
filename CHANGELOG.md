# Change Log

이 프로젝트에서 주목할만한 모든 변경 사항이이 파일에 문서화됩니다.
[Keep a Changelog](https://keepachangelog.com/ko/1.0.0/)의 형식을 기본으로 구성됩니다.

## [5.8.2-php8.0-apache-redis] 2021-11-29

### Changed

- 기본 베이스 이미지 wordpress 5.8.2로 변경

## [v1.1.0 php8.0-apache-redis] 2021-10-08

### Added

- php extentions php5-redis
### Chagned

- wordpress-fpm 사용을 wordpress-apache로 변경
  - 따로 스트림할 nginx가 필요x

## [v0.0.2] 2021-09-10

### Changed

- Redis 컨테이너가 연결될때 다른 컨테이너에 있기 때문에 Redis 서버를 자동으로 연결할 수 없음 그래서 해당 Redis 컨테이너를 연결할 `REDIS_HOST` define 옵션을 설정할 수 있게 설정

## [v0.0.1] 2021-09-10

### Added

- redis wordpress setting dockerizing
- github action - build & deploy