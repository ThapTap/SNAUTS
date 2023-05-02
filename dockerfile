FROM php:8.1.18-apache AS php
COPY /sembarang /var/www/html/

RUN apt-get update -y
RUN docker-php-ext-install mysqli

RUN chown -R www-data:www-data /var/www/html/
RUN chmod -R 774 /var/www/html/

FROM mysql:latest AS sql
COPY redlock-db.sql /docker-entrypoint-initdb.d/

ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_USER=uname
ENV MYSQL_PASSWORD=password

FROM jenkins/jenkins:latest as jenkins
