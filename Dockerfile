FROM wordpress:6.4.1-php8.0-fpm

# Установка composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

# Установка библиотеки libcurl
RUN apt-get update && apt-get install -y libcurl4-openssl-dev

WORKDIR .