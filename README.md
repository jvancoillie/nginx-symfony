# nginx-symfony
[![](https://images.microbadger.com/badges/image/jvancoillie/nginx-symfony.svg)](https://microbadger.com/images/jvancoillie/nginx-symfony "Get your own image badge on microbadger.com")

this [nginx-symfony](https://hub.docker.com/r/jvancoillie/nginx-symfony/) image based on [nginx:latest](https://github.com/nginxinc/docker-nginx/blob/844627e5cb58c751f8b43824c7b6ea84529c73bf/mainline/jessie/Dockerfile)

## Run
```bash
$ docker run -d --name nginx_symfony jvancoillie/nginx-symfony -v path/to/symfony/project:/var/www/html/symfony
```
## Configuration
this image use 3 parameters that could be change on run.

| variable      | default value |       
| ------------- |:-------------:|
| FPM_HOST      | 127.0.0.1     |
| FPM_PORT      | 9000          |
| PROJECT_NAME  | symfony       |

## Development env with docker-compose.yml

this image is used on my [docker-symfony](https://github.com/jvancoillie/docker-symfony) environment.

```yaml
# docker-compose.yml
version: '2'

services:
    php: #php-fpm container
        image: jvancoillie/php-fpm-symfony 
        ports:
            - 9000:9000
        links:
            - db:mysqldb
            - redis
        volumes:
            - ${SYMFONY_PROJECT_PATH}:/var/www/html/symfony #replace $SYMFONY_PROJECT_PATH in .env file 
            - ./logs/symfony:/var/www/html/symfony/var/logs
    db: #mysql container
        image: mysql
        volumes:
            - ./data/db:/var/lib/mysql #mysql data 
        environment:
            MYSQL_RANDOM_ROOT_PASSWORD: "yes"
            MYSQL_USER: ${MYSQL_USER}
            MYSQL_PASSWORD: ${MYSQL_PASSWORD}
                    
    redis: # redis container
        image: redis:alpine
        ports:
            - 6379:6379

    nginx: #nginx container
        image: jvancoillie/nginx-symfony
        ports:
            - 80:80
        environment: #need for nginx server config
            - FPM_HOST=phpfpmhost      
            - FPM_PORT=9000
            - PROJECT_NAME=symfony      
        links:
            - php:phpfpmhost
        volumes_from:
            - php:ro
        volumes:
            - ./logs/nginx/:/var/log/nginx

```

```bash
$ docker-compose up -d 
```




