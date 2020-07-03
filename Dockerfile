#
# Install PHP Dependencies
#
FROM composer:1 as composer

COPY database/ database/

COPY composer.json composer.json
COPY composer.lock composer.lock

RUN composer install \
    --ignore-platform-reqs \
    --no-interaction \
    --no-plugins \
    --no-scripts \
    --prefer-dist


FROM parsaeian/php-base
COPY . /tmp/public/
COPY --from=composer /app/vendor/ /tmp/public/vendor/

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]

EXPOSE 9000