#!/bin/sh
set -e

echo "Deploying application ..."

# Change to the project directory.
cd /var/www/html/$1
sudo chown -R adm-aej:adm-aej .
git pull origin $2
# Enter maintenance mode
    # Install dependencies based on lock file
    composer install --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-reqs

    # Migrate database
    php artisan migrate --force
    # run seed in app
    #php artisan db:seed --force

    #storage link
    php artisan storage:link

    # Clear caches
    php artisan cache:clear

    # Clear and cache routes
    php artisan route:cache

    # Clear and cache config
    php artisan config:cache

    # Clear and cache views
    php artisan view:cache
sudo chown -R apache:apache .
echo "Application deployed!"

