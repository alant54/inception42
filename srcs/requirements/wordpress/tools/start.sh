#!/bin/bash

if [ ! -f  "/usr/local/bin/wp" ];
then
    echo "Installing WordPress CLI..."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp

    echo "Updating ownership..."
    chown -R www-data:www-data *
    chmod -R 755 *
else
    echo "WordPress CLI already installed"
fi

if [ ! -f "wp-config.php" ];
then
    echo "Installing WordPress..."
    wp core download --allow-root
    wp core config --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PWD --dbhost=mariadb --allow-root
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN_USR --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_EMAIL --allow-root
    wp user create $WP_USR $WP_EMAIL --role=author --user_pass=$WP_PWD --allow-root

    echo "Installing Redis..."
    wp config set WP_REDIS_HOST redis --allow-root
    wp config set WP_REDIS_PORT 6379 --raw --allow-root
    wp config set WP_REDIS_PASSWORD $REDIS_PWD --allow-root
    wp plugin install redis-cache --activate --allow-root
    wp plugin update --all --allow-root
    wp redis enable --allow-root
else
    echo "WordPress already installed"
fi

echo "Starting php-fpm..."
/usr/sbin/php-fpm7.4 -F



