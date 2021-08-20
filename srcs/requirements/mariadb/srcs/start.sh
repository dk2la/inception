#!/bin/sh

service mysql start

db_exist=$(echo "show databases;" | mysql | grep $MYSQL_DATABASE | wc -l)
echo "create database if not exists $MYSQL_DATABASE;" | mysql
echo "grant all on *.* to '$MYSQL_USER'@'%' identified by '$MYSQL_PASSWORD' with grant option; flush privileges;" | mysql

if [ $db_exist = "0" ]
then
	mysql $MYSQL_DATABASE < wordpress.sql
fi

service mysql stop


mysqld -u root
