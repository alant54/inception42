FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install mariadb-server -y

COPY ./tools/start.sh /

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /start.sh

CMD ["/start.sh"]
