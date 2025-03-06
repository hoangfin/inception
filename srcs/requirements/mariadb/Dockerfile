FROM alpine:3.20

RUN apk update \
	&& apk add --no-cache mariadb mariadb-client \
	&& mkdir -p /var/lib/mysql /run/mysqld \
    && chown -R mysql:mysql /var/lib/mysql /run/mysqld

EXPOSE 3306

CMD ["mysqld_safe"]
