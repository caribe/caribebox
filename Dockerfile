FROM	php:5.6-apache
WORKDIR /var/www
RUN apt-get update && apt-get -y install libpng-dev libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli gettext mcrypt gd \
    && docker-php-source delete
RUN	a2enmod rewrite expires ssl && \
		ln -s /var/log/apache2 /var/log/httpd && \
		chgrp www-data /var/local
COPY	docker.ini /usr/local/etc/php/conf.d/
