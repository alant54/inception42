FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install wget -y

COPY ./tools/start.sh /

RUN chmod +x /start.sh

CMD ["/start.sh"]