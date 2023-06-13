
#!/bin/bash
#set-up WordPress using wp-cli, and configuring PHP-FPM. 
# create necessary directories
mkdir -p /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
# change to directory for WordPress installation
cd /var/www/html/wordpress 

# download wp-cli tool
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# make it executable and copy to bin
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

# download WordPress core
wp core download --allow-root

# rename config file and replace with custom one
# mv wp-config-sample.php wp-config.php
# sed -i -r "s/db1/$DB_NAME/1" wp-config.php
# sed -i -r "s/user/$DB_USER/1" wp-config.php
# sed -i -r "s/pwd/$DB_PASS/1" wp-config.php

# # install WordPress
# wp core install \
# --url=$DOMAIN_NAME \
# --title=simple_title \
# --admin_user=Abla \
# --admin_password=abla1234 \
# --admin_email=Ouhagaabla@gmail.com \
# --skip-email \
# --allow-root

# # create a new user
# wp user create \
# user Ouhagaabla@gmail.com \
# --role=author \
# --user_pass=abouhaga \
# --allow-root

# update PHP-FPM configuration : updates the PHP-FPM configuration file to listen on port 9000 instead of using a Unix socket. 
sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

# start PHP-FPM service
/usr/sbin/php-fpm7.3 -F -R