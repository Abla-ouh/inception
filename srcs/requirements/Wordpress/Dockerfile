FROM debian:buster

WORKDIR /var/www/html

RUN apt-get update \
    && apt-get install -y php-fpm php-mbstring php-mysql php-phar curl \
    && mkdir -p var/www/html /run/php

COPY ./tools/wp-config.php ./tools/wp.sh / 

RUN chmod +x /wp.sh

CMD ["sh", "/wp.sh"]