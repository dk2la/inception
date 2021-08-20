FROM debian:buster

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y nginx vim openssl

RUN		rm -rf /etc/nginx/conf.d/default.conf
COPY 	./srcs/default.conf /etc/nginx/conf.d/default.conf  

RUN		openssl req -days 365 -newkey rsa:2048  \
		-x509 \
		-sha256 \
		-nodes \
		-out /etc/ssl/certs/localhost.crt \
		-keyout /etc/ssl/certs/localhost.key \
		-subj '/C=RU/ST=XX/L=XX/O=XX/OU=XX/CN=born2code'

RUN chmod 777 -R /var/www 
RUN chown -R www-data:www-data /var/www/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
