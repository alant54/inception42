FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install nginx openssl gettext -y

COPY ./tools/start.sh /

RUN chmod +x /start.sh

COPY ./conf/default.conf /

CMD ["/start.sh"]