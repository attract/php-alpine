FROM php:8.0-fpm-alpine

MAINTAINER AttractGroup

RUN apk add --no-cache mysql-client msmtp perl wget procps shadow libzip libpng libjpeg-turbo libwebp freetype icu

RUN apk upgrade --update
RUN apk add nano
RUN apk add bash
RUN apk add coreutils
RUN apk add freetype-dev
RUN apk add libjpeg-turbo-dev
RUN apk add libmcrypt-dev
RUN apk add libpng-dev
RUN apk add curl
RUN apk add libmemcached-dev
RUN apk add git
RUN apk add mysql-client
RUN apk add postgresql-dev
RUN apk add zlib-dev
RUN apk add icu-dev
RUN apk add supervisor
RUN apk add imap-dev
RUN apk add unzip
RUN apk add krb5-dev
RUN apk add libzip-dev
RUN apk add libxml2-dev
RUN apk add oniguruma-dev
RUN apk add imagemagick

RUN apk add --no-cache --virtual build-essentials \
    icu-dev icu-libs zlib-dev g++ make automake autoconf libzip-dev \
    libpng-dev libwebp-dev libjpeg-turbo-dev freetype-dev && \
    docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp && \
    docker-php-ext-install gd && \
    docker-php-ext-install mysqli && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install intl && \
    docker-php-ext-install opcache && \
    docker-php-ext-install exif && \
    docker-php-ext-install zip && \
    apk del build-essentials && rm -rf /usr/src/php*


RUN apk add --update --no-cache autoconf g++ make
RUN pecl install redis
RUN docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER 1
