#!/bin/bash

export BORG_UNKNOWN_UNENCRYPTED_REPO_ACCESS_IS_OK=yes

echo "Borg create backup"
borg create /mnt/backup::backup-wordpress{now} /mnt/wordpress /mnt/mariadb

echo "Borg prune old backups"
borg prune /mnt/backup --keep-last=8 -v
