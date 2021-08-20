FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y wget php php-common \
            php-cli php-fpm php-json php-pdo php-mysql php-zip php-gd \
            php-mbstring php-curl php-xml php-pear php-bcmath netcat-openbsd

RUN		mkdir -p /run/php
RUN		mkdir -p /var/www/html

RUN 	echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN		wget https://wordpress.org/latest.tar.gz
RUN		tar -xf latest.tar.gz
RUN		rm -rf latest.tar.gz
RUN		mv wordpress /var/www/html/wordpress
RUN		chmod 777 /var/www/*

COPY    ./srcs/wp-config.php /var/www/html/wordpress

EXPOSE	9000

COPY    ./srcs/start.sh /
RUN     chmod +x /start.sh

CMD		bash start.sh
