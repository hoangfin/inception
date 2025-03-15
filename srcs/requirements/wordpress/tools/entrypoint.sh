#!/bin/sh

set -e

/usr/local/bin/wp-install.sh

echo "Starting PHP-FPM..."
exec php-fpm83 -F
