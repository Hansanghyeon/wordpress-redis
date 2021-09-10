# Change Log

이 프로젝트에서 주목할만한 모든 변경 사항이이 파일에 문서화됩니다.
[Keep a Changelog](https://keepachangelog.com/ko/1.0.0/)의 형식을 기본으로 구성됩니다.

## [v0.0.2] 2021-09-10

### Changed

- Redis 컨테이너가 연결될때 다른 컨테이너에 있기 때문에 Redis 서버를 자동으로 연결할 수 없음 그래서 해당 Redis 컨테이너를 연결할 `REDIS_HOST` define 옵션을 설정할 수 있게 설정

## [v0.0.1] 2021-09-10

### Added

- redis wordpress setting dockerizing
- github action - build & deploy