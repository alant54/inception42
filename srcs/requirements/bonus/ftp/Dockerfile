FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install vsftpd -y

COPY ./tools/start.sh /

COPY ./conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod +x /start.sh

CMD ["/start.sh"]