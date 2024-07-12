#!/bin/bash

if [ ! -f "/mnt/backup/README" ];
then
  echo "Init borg repository"
  borg init --encryption=none /mnt/backup
fi

echo "Loading crontab"
crontab /etc/crontab

echo "Starting cron service"
cron -f

