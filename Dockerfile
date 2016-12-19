FROM nginx:latest
MAINTAINER Jérémy Vancoillie <jeremy.vancoillie@gmail.com>

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template

ENV FPM_HOST=127.0.0.1 FPM_PORT=9000 

RUN mkdir -p /var/www/html/
RUN sed -e "s/__fpmhost__/${FPM_HOST}/g;s/__fpmport__/${FPM_PORT}/g" /etc/nginx/conf.d/nginx.conf.template > /etc/nginx/conf.d/default.conf

CMD  nginx -g 'daemon off;'

