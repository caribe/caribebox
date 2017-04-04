FROM	php:5.6-apache
WORKDIR /var/www
RUN apt-get update && apt-get -y install libpng-dev libmcrypt-dev
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql mysqli gettext mcrypt gd \
    && docker-php-source delete
RUN	a2enmod rewrite expires && \
		ln -s /var/log/apache2 /var/log/httpd && \
		mkdir /var/local/vetrina.co && \
		mkdir /var/local/vetrina.co/smarty_cache && \
		mkdir /var/local/vetrina.co/smarty_compile && \
		mkdir /var/local/vetrina.co/css && \
		mkdir /var/local/vetrina.co/pvt-media && \
		mkdir /var/local/vetrina.co/templates && \
		mkdir /var/local/vetrina.co/cache && \
		chown -R www-data:www-data /var/local/vetrina.co
COPY	docker.ini /usr/local/etc/php/conf.d/
