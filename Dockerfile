FROM nginx:latest
MAINTAINER Jérémy Vancoillie <jeremy.vancoillie@gmail.com>

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY create_server_file /usr/bin/create_server_file
ENV FPM_HOST=127.0.0.1 FPM_PORT=9000 

RUN mkdir -p /var/www/html/

CMD  /usr/bin/create_server_file && nginx -g 'daemon off;'

