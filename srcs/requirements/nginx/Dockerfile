FROM alpine:3.20

# Install dependencies
RUN apk update && apk add --no-cache \
    nginx \
    openssl \
    pcre \
    zlib \
    libressl-dev \
    gcc \
    g++ \
    make

# Enable TLSv1.3 in NGINX configuration
#RUN sed -i '/^http {/a ssl_protocols TLSv1.2 TLSv1.3;' /etc/nginx/nginx.conf

# Expose the port for NGINX
EXPOSE 443

# Add the default configuration and a self-signed certificate
COPY conf/default.conf /etc/nginx/http.d/default.conf
# COPY ssl/server.crt /etc/ssl/certs/server.crt
# COPY ssl/server.key /etc/ssl/private/server.key

# Run NGINX in the foreground
CMD ["nginx", "-g", "daemon off;"]
# CMD ["tail", "-f", "/dev/null"]

