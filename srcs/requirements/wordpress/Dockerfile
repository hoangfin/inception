FROM alpine:3.20

RUN apk update && apk add --no-cache \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-json \
	php83-session \
	php83-gd \
	php83-curl \
	php83-xml \
	php83-mbstring \
	php83-tokenizer \
	php83-openssl \
	php83-zlib \
	php83-fileinfo \
	php83-zip \
	curl \
	tar

WORKDIR /var/www

# Download and extract WordPress
RUN curl -o wordpress.tar.gz -fSL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz \
    && rm wordpress.tar.gz \
	&& addgroup -S nginx \
	&& adduser -S -G nginx -g nginx nginx \
	&& chown -R nginx:nginx /var/www/wordpress \
	&& chmod -R 755 /var/www/wordpress

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf

COPY tools/entrypoint.sh /usr/local/bin/entrypoint.sh

RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 9000

CMD ["/usr/local/bin/entrypoint.sh"]
