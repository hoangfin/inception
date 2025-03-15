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

COPY conf/default.conf /etc/nginx/http.d/default.conf

COPY tools/entrypoint.sh /usr/bin/local/entrypoint.sh

RUN chmod +x /usr/bin/local/entrypoint.sh

EXPOSE 443

ENTRYPOINT [ "/usr/bin/local/entrypoint.sh" ]
