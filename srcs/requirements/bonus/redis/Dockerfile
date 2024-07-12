FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install redis -y

COPY ./conf/redis.conf /etc/redis/redis.conf

COPY ./tools/start.sh /

RUN chmod +x /start.sh

CMD ["/start.sh"]
