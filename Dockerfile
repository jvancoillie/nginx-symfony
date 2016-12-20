FROM nginx:latest
MAINTAINER Jérémy Vancoillie <jeremy.vancoillie@gmail.com>

COPY symfony.conf.template /etc/nginx/conf.d/symfony.conf.template
COPY create_nginx_server /usr/bin/create_nginx_server

ENV FPM_HOST=127.0.0.1 FPM_PORT=9000 PROJECT_NAME=symfony 

WORKDIR /var/www/html

CMD  /usr/bin/create_nginx_server && nginx -g 'daemon off;'

