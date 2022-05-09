# Thank to https://r.je/sendmail-php-docker
FROM php:7.4-fpm

RUN apt-get update && \

    apt-get install -y \

        zlib1g-dev libzip-dev sendmail mailutils sendmail-cf


RUN echo "sendmail_path=/usr/sbin/sendmail -t -i" >> /usr/local/etc/php/conf.d/sendmail.ini

RUN docker-php-ext-install pdo pdo_mysql zip

RUN sed -i '/#!\/bin\/sh/aservice sendmail restart' /usr/local/bin/docker-php-entrypoint

RUN sed -i '/#!\/bin\/sh/aecho "$(hostname -i)\t$(hostname) $(hostname).localhost" >> /etc/hosts' /usr/local/bin/docker-php-entrypoint

RUN sed -i '/#!\/bin\/sh/amkdir -p /etc/mail/authinfo/ && cd /etc/mail/authinfo/ && chmod -R 700 . && makemap hash smtp-auth < smtp-auth && yes "y" | sendmailconfig && cd -' \
    /usr/local/bin/docker-php-entrypoint

# And clean up the image

RUN rm -rf /var/lib/apt/lists/*
