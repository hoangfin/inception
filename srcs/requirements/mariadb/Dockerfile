FROM alpine:3.20

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY tools/setup-mariadb.sh /usr/local/bin/setup-mariadb.sh

RUN chmod +x /usr/local/bin/setup-mariadb.sh \
	&& mkdir -p /var/lib/mysql /var/log/mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld \
	&& mysql_install_db --basedir=/usr --datadir=/var/lib/mysql --user=mysql

EXPOSE 3306

CMD ["/usr/local/bin/setup-mariadb.sh"]
