FROM nginx:latest
MAINTAINER Jérémy Vancoillie <jeremy.vancoillie@gmail.com>

COPY nginx.conf.template /etc/nginx/conf.d/nginx.conf.template
COPY index.html /usr/share/nginx/html/
COPY create_nginx_servers /usr/bin/create_nginx_servers

ENV FPM_HOST=127.0.0.1 FPM_PORT=9000 

RUN mkdir -p /var/www/html/

#RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
#	php /usr/local/bin/composer self-update

#RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony && \
#	chmod a+x /usr/local/bin/symfony


CMD /usr/bin/create_nginx_servers && nginx -g 'daemon off;'

