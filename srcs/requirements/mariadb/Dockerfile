FROM alpine:3.20

RUN apk update && apk add --no-cache mariadb mariadb-client

COPY tools/init-db.sh /usr/local/bin/init-db.sh

RUN chmod +x /usr/local/bin/init-db.sh && /usr/local/bin/init-db.sh

EXPOSE 3306

CMD ["mysqld_safe"]
