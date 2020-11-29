FROM php:7.2-fpm 
MAINTAINER   Pierre TIELEMANS <hello@pierre.systems>
  
RUN apt-get update && apt-get install -y \  
    zip  
  
RUN pecl install xdebug \  
    && docker-php-ext-enable xdebug  

# Those lines are important for remote interpreter configuration
RUN mkdir -p /var/www/app
WORKDIR /var/www/app


# Add xdebug to PHP
ADD xdebug.ini /etc/php/conf.d/  
  
CMD ["php-fpm"]
