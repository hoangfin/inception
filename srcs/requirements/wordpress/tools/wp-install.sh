#!/bin/sh

# set up database connection and admin user
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create \
		--dbname="$MYSQL_DATABASE" \
		--dbuser="$MYSQL_USER" \
		--dbpass="$MYSQL_PASSWORD" \
		--dbhost="$MYSQL_HOST" \
		--path=/var/www/wordpress/ \
		--allow-root

    wp core install \
    	--url="$DOMAIN_NAME" \
		--title="$WP_TITLE" \
		--admin_user="$WP_ADMIN_USR" \
		--admin_password="$WP_ADMIN_PWD" \
		--admin_email="$WP_ADMIN_EMAIL" \
		--skip-email \
		--allow-root
fi

# create wordpress user
if ! wp user get "$WP_USR" --field=user_login --allow-root > /dev/null 2>&1; then
    wp user create "$WP_USR" "$WP_EMAIL" --role=author --user_pass="$WP_PWD" --allow-root
fi
