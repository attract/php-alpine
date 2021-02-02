FROM php:8.0-fpm-alpine

MAINTAINER AttractGroup

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

RUN docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) php8.0-common php8.0-mysql php8.0-xml php8.0-curl php8.0-gd php8.0-imagick php8.0-cli php8.0-dev php8.0-imap php8.0-mbstring php8.0-opcache php8.0-soap php8.0-zip -y


RUN apk add --update --no-cache autoconf g++ make
RUN pecl install redis
RUN docker-php-ext-enable redis

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

ENV COMPOSER_ALLOW_SUPERUSER 1
RUN composer global require "hirak/prestissimo:^0.3"
