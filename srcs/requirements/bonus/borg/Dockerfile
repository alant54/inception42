FROM debian:bullseye

RUN apt-get update -y && apt-get upgrade -y && apt-get install borgbackup cron -y

COPY ./tools/start.sh /

COPY ./tools/backup.sh /

COPY ./conf/crontab /etc/crontab

RUN chmod +x /start.sh /backup.sh /etc/crontab

CMD ["/start.sh"]