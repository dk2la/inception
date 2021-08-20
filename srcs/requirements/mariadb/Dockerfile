FROM    debian:buster 

RUN     apt-get update
RUN     apt-get install -y mariadb-server vim 

COPY    ./srcs/start.sh . 
RUN     chmod +x start.sh 

EXPOSE  3306
COPY    ./srcs/my.cnf  /etc/mysql/my.cnf
COPY    ./srcs/wordpress.sql  /wordpress.sql
RUN     chmod +rw /etc/mysql/my.cnf

ENTRYPOINT ["sh", "/start.sh"]
