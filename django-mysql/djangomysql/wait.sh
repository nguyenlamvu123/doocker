#!/bin/sh

while ! nc -z db 3306 ; do
    echo "Waiting for the MySQL Server"
    sleep 3
done

# Collect static files
echo "#########################################Collect static files"
#python manage.py collectstatic --noinput

# Apply database migrations
echo "#########################################Apply database migrations"
python manage.py migrate

# Start server
echo "#########################################Starting server"
python manage.py runserver 0.0.0.0:8000
