#!/bin/bash

set -o errexit
set -o pipefail

echo "> Copy files to shared directory ..."
cp -rv /tmp/public/. /var/www/html

echo "> Set Permissions .."
find /var/www/html -exec chown -R www-data:www-data {} \;
find /var/www/html  -type f -exec chmod 664 {} \; 
find /var/www/html -type d -exec chmod 775 {} \;

echo  "> Key Generating...\n"
php /var/www/html/artisan key:generate

echo  "> Migrating the database ...\n"
php /var/www/html/artisan migrate --force

php-fpm

exec "$@"

