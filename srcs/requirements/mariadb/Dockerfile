FROM		alpine:3.14

#dependencies
RUN apk update
RUN apk upgrade
RUN apk add openrc mariadb mariadb-common mariadb-client mariadb-server-utils

#config
RUN rm -f	/etc/mysql/my.cnf \
		/etc/my.cnf \
		~/my.cnf

COPY conf/default.conf /etc/mysql/my.cnf
COPY conf/default.conf /etc/my.cnf
COPY conf/default.conf ~/my.cnf

#folders
RUN mkdir -p /run/mysqld
RUN mkdir -p /var/lib/mysql
RUN chown -R mysql /var/lib/mysql
RUN chmod 777 /var/lib/mysql

#port
EXPOSE		3306

#setup script
COPY tools/setup-db.sh setup-db.sh
RUN chmod +x setup-db.sh

CMD ["sh", "setup-db.sh"]

