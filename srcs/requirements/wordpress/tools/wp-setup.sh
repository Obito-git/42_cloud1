#!/bin/sh

DB_HOST="localhost:3306"

#CLI tool
curl	-O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod	+x wp-cli.phar
mv	-f wp-cli.phar /usr/local/bin/wp

wp	core download --allow-root --path="/var/www/html"

rm	-f /var/www/html/wp-config.php
cp	./wp-config.php /var/www/html/wp-config.php


while true; do
    result=$(mysql -u root -p"DB_ROOT_PASSWORD" -h "$DB_HOST" -e \
    "SHOW DATABASES LIKE '$DB_DATABASE_NAME';" | grep -q "$DB_DATABASE_NAME" && echo 1 || echo 0)

    if [ "$result" -eq 0 ]; then
        break
    else
        sleep 2
    fi
done

#admin
wp	core install \
		--allow-root \
		--path="/var/www/html" \
		--url=${WORDPRESS_HOST} \
		--title=${WORDPRESS_TITLE} \
		--admin_user=${WORDPRESS_ADMIN_USER} \
		--admin_password=${WORDPRESS_ADMIN_PASSWORD} \
		--admin_email=${WORDPRESS_ADMIN_EMAIL} \
		--skip-email
#add user
wp	user create \
		--allow-root \
		--path="/var/www/html" \
		${WORDPRESS_USER} \
		${WORDPRESS_EMAIL} \
		--role=author \
		--user_pass=${WORDPRESS_PASSWORD}

exec	php-fpm7 -F -R
