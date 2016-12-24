FROM nginx:latest
MAINTAINER Jérémy Vancoillie <jeremy.vancoillie@gmail.com>

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/jvancoillie/nginx-symfony.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.schema-version="1.0.0"

COPY symfony.conf.template /etc/nginx/conf.d/symfony.conf.template
COPY create_nginx_server /usr/bin/create_nginx_server

ENV FPM_HOST=127.0.0.1 FPM_PORT=9000 PROJECT_NAME=symfony 

WORKDIR /var/www/html

CMD  /usr/bin/create_nginx_server && nginx -g 'daemon off;'

