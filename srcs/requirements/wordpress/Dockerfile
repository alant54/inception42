FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install netcat php7.4-fpm php-mysql php-cgi php-gd php-cli php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip redis php-redis curl -y 

COPY ./tools/start.sh /

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN chmod +x /start.sh

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php

WORKDIR /var/www/html/

CMD ["/start.sh"]