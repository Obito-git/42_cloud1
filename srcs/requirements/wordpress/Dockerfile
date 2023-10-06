FROM	alpine:3.14

# installing dependencies
RUN		apk upgrade
RUN		apk update
RUN		apk add php7 curl wget openrc php7-curl mysql php7-dom php7-fpm php7-opcache php7-mysqli php7-session \
		        php7-iconv php7-json php7-gd php7-xml php7-common php7-imap php7-pdo php7-pdo_mysql \
			php7-soap php7-xmlrpc php7-mcrypt php7-posix php7-cgi php7-gd php7-redis php7-gettext \
			php7-ldap php7-ctype php7-phar php7-zlib
# updating php-fpm config
RUN	rm -f /etc/php7/php-fpm.d/www.conf
COPY	conf/default.conf /etc/php7/php-fpm.d/www.conf

# what is www-data user?
# https://askubuntu.com/questions/873839/what-is-the-www-data-user
RUN	mkdir -p /var/www/html && adduser -u 82 -D -S -G www-data www-data && \
        chmod 777 -R /var/www/html && chown -R www-data:www-data /var/www/html

# port
EXPOSE	9000

# wp configs
COPY	tools/wp-setup.sh ./
COPY	conf/wp-config.php ./
RUN	chmod 777 ./wp-setup.sh

CMD     ["sh", "wp-setup.sh"]

