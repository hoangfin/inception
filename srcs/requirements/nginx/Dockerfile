FROM alpine:3.20

RUN apk update && apk add --no-cache \
    nginx \
    openssl \
    pcre \
    zlib \
    libressl-dev \
    gcc \
    g++ \
    make

# Generate a self-signed certificate
RUN openssl req -x509 -newkey rsa:4096 \
			-keyout /etc/ssl/private/server.key \
			-out /etc/ssl/certs/server.crt -days 365 -nodes \
			-subj "/C=FI/ST=Uusima/L=Helsinki/O=Hive Helsinki/OU=/CN=hoatran.42.fr"

COPY conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
