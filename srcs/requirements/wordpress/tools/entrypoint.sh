#!/bin/sh

# Set PHP configuration dynamically
cat <<EOF > /etc/php83/conf.d/custom.ini
mysqli.default_host = "${MYSQL_HOST}"
mysqli.default_user = "${MYSQL_USER}"
mysqli.default_pw = "${MYSQL_PASSWORD}"
mysqli.default_db = "${MYSQL_DATABASE}"
EOF

echo "Starting PHP-FPM..."
exec php-fpm83 -F
