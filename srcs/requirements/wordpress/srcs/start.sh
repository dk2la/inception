echo ">> Waiting for mariadb to start"
while ! `nc -z mariadb 3306`; do sleep 3; done
echo ">> mariadb has started"

echo "start wp"
/sbin/ip route|awk '/default/ { print $3 }'

sed -i -e "s|REG_DB_NAME|'$WORDPRESS_DB_NAME'|g" /var/www/html/wordpress/wp-config.php
sed -i -e "s|REG_DB_USER|'$WORDPRESS_DB_USER'|g" /var/www/html/wordpress/wp-config.php
sed -i -e "s|REG_DB_PASSWORD|'$WORDPRESS_DB_PASSWORD'|g" /var/www/html/wordpress/wp-config.php
sed -i -e "s|REG_DB_HOST|'$WORDPRESS_DB_HOST'|g" /var/www/html/wordpress/wp-config.php

php-fpm7.3 -F -R
