FROM alpine:3.20.6

RUN apk update && apk add --no-cache \
	php83 \
	php83-phar \
	php83-fpm \
	php83-mysqli \
	php83-json \
	php83-gd \
	php83-curl \
	php83-xml \
	php83-mbstring \
	curl

RUN mkdir -p /var/www/wordpress

WORKDIR /var/www/wordpress

RUN curl -sSL https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp \
	&& chmod +x /usr/local/bin/wp \
	&& php -d memory_limit=512M /usr/local/bin/wp core download --allow-root \
	&& addgroup -S nginx \
	&& adduser -S -G nginx -g nginx nginx \
	&& chown -R nginx:nginx /var/www/wordpress \
	&& chmod -R 755 /var/www/wordpress

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

COPY tools/ /usr/local/bin/

RUN chmod +x /usr/local/bin/*

EXPOSE 9000

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]
