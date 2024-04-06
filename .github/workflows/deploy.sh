#!/bin/sh
set -e

echo "Deploying application ..."

# Change to the project directory.
cd ~/var/www/html/$1

# Enter maintenance mode
(php artisan down) || true
    # Update codebase
    git pull origin $2

    # Install dependencies based on lock file
    composer install --no-interaction --prefer-dist --optimize-autoloader --ignore-platform-reqs

    # Migrate database
    php artisan migrate --force

    # Note: If you're using queue workers, this is the place to restart them.
    # ...

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
    
# Exit maintenance mode
php artisan up

echo "Application deployed!"

