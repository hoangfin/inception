FROM alpine:3.20.6

RUN apk update \
	&& apk add --no-cache mariadb mariadb-client \
	&& mkdir -p /var/lib/mysql /var/log/mysql /run/mysqld \
	&& chown -R mysql:mysql /var/lib/mysql /var/log/mysql /run/mysqld \
	&& mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3306

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
