#!/bin/bash

if [ -f "/var/lib/mysql/mariadb_config_done" ];
then
   echo "MariaDB has already been configured. Skipping configuration steps."
   echo "Starting MariaDB..."
   mysqld_safe
else
    echo "Starting MariaDB..."
    mysqld_safe &

    echo "Waiting for MariaDB to start..."
    while ! mysqladmin ping --silent;
    do
        sleep 1
    done

    echo "Configure MariaDB..."
    mysql -u root -e "CREATE DATABASE $DB_NAME;"
    mysql -u root -e "CREATE USER '$DB_USER' IDENTIFIED BY '$DB_PWD';"
    mysql -u root -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER';"
    mysql -u root -e "FLUSH PRIVILEGES;"
    mysql -u root -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$DB_ROOT_PWD';"

    echo "Mark configuration as done..."
    touch "/var/lib/mysql/mariadb_config_done"
fi

