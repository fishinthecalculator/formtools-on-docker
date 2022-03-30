FROM php:7.3-apache

RUN a2enmod rewrite

COPY ./000-default.conf /etc/apache2/sites-available/000-default.conf

EXPOSE 80
