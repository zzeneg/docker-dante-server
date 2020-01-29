# docker-dante-server
Dockerized Alpine-based Dante server with user authentication


## Usage
- specify build args:
  - USER - username
  - PASSWORD - password
- this image already includes basic Dante configuration, but you can specify your own by mounting it to `/etc/sockd.conf`
- docker-compose example
  ```yaml
  dante:
    container_name: dante
    build:
      context: https://github.com/zzeneg/docker-dante-server.git
      args:
        USER: username
        PASSWORD: password
    restart: unless-stopped
    ports:
      - 1080:1080
  ```
