#!/bin/sh

mkdir -p /home/amyroshn/data/database
mkdir -p /home/amyroshn/data/www

touch tmp_file
chmod 777 tmp_file

cat << EOF > tmp_file
CREATE DATABASE IF NOT EXISTS $DB_DATABASE_NAME;
USE $DB_DATABASE_NAME;
FLUSH PRIVILEGES ;
GRANT ALL ON *.* TO 'root'@'%' identified by '$DB_ROOT_PASSWORD' WITH GRANT OPTION ;
GRANT ALL ON *.* TO 'root'@'localhost' identified by '$DB_ROOT_PASSWORD' WITH GRANT OPTION ;
SET PASSWORD FOR 'root'@'localhost'=PASSWORD('${DB_ROOT_PASSWORD}') ;
FLUSH PRIVILEGES ;
GRANT ALL ON \`$DB_DATABASE_NAME\`.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';
FLUSH PRIVILEGES ;
EOF

mysql_install_db --user=root --datadir=/var/lib/mysql
mysqld --user=root --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 < tmp_file
exec mysqld --user=root --console --skip-name-resolve --skip-networking=0 $@
