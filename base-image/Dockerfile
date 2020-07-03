FROM php:7.4-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip 

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql mbstring exif \
    pcntl bcmath gd 

WORKDIR /var/www/html/