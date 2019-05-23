FROM php:7.3-fpm-alpine
LABEL maintainer="Oleg Gorbunov <dev.oleg.gorbunov@gmail.com>"

RUN echo 'nameserver 8.8.8.8' > /etc/resolv.conf
RUN cp /usr/local/etc/
RUN docker-php-ext-install pdo pdo_mysql && \
    rm -f /var/cache/apk/*

# Install Composer.
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && ln -s $(composer config --global home) /root/composer
ENV PATH $PATH:/root/composer/vendor/bin
