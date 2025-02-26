#!/bin/sh

/script/wait_for_db.sh

/script/db_is_empty.sh && /script/load_initial_fixtures.sh

cd /app/podnik

echo "Applying migrations"
python manage.py migrate --noinput
echo "Migrations applied"

echo "Creating superuser"
python manage.py createsuperuser --noinput
echo "Superuser created"

uv pip install --system -r /conf/requirements.txt

# python manage.py collectstatic --noinput

exec gunicorn podnik.wsgi:application --bind 0.0.0.0:8000 --workers 4 --threads 2 --timeout 30 --max-requests 5000 --log-level debug