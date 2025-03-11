FROM alpine:3.20

# Install required dependencies
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

# Create the www-data user and group
RUN if ! getent group www-data > /dev/null 2>&1; then \
        addgroup -S www-data; \
    fi && \
    if ! getent passwd www-data > /dev/null 2>&1; then \
        adduser -S www-data -G www-data; \
    fi

WORKDIR /var/www

# Download and extract WordPress
RUN curl -o wordpress.tar.gz -fSL https://wordpress.org/latest.tar.gz \
    && tar -xzf wordpress.tar.gz \
    && rm wordpress.tar.gz

#Set permissions
RUN chown -R www-data:www-data /var/www/wordpress

# Copy the custom wp-config.php for WordPress
COPY conf/wp-config.php /var/www/wordpress/wp-config.php

# Configure PHP-FPM
RUN sed -i 's|;listen.owner = nobody|listen.owner = www-data|' /etc/php83/php-fpm.d/www.conf \
    && sed -i 's|;listen.group = nobody|listen.group = www-data|' /etc/php83/php-fpm.d/www.conf \
    && sed -i 's|listen = 127.0.0.1:9000|listen = 0.0.0.0:9000|' /etc/php83/php-fpm.d/www.conf

# Expose PHP-FPM port
EXPOSE 9000

# Start PHP-FPM
CMD ["php-fpm83", "-F"]
