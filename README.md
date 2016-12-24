# nginx-symfony
[![](https://images.microbadger.com/badges/image/jvancoillie/nginx-symfony.svg)](https://microbadger.com/images/jvancoillie/nginx-symfony "Get your own image badge on microbadger.com")

repository for nginx docker

# Usage

### Development env with docker-compose.yml

docker-compose.yml:

```
version: '2'
services:
  web:
    image: jvancoillie/nginx-symfony
    ports:
      - "80:80"
    volumes:
      - .:/var/www/html
    depends_on:
      - php
    links:
      - php:phpfpmhost
    environment:
      - FPM_HOST=phpfpmhost  
  php:
    image: jvancoillie/php-fpm-symfony
    volumes:
      - .:/var/www/html
```
Use ```docker-compose up``` command to start your development environment.


