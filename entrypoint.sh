#!/bin/sh
# Apply database migrations
python manage.py migrate --noinput

# Collect static files (if you’re serving them via Django)
python manage.py collectstatic --noinput

# Start Gunicorn, binding to the port Dokploy provides via the $PORT variable.
exec gunicorn myproject.wsgi:application --bind 0.0.0.0:$PORT
