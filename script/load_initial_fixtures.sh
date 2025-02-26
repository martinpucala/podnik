#!/bin/sh

echo "Loading initial fixtures..."
if [ -f /app/initial_fixtures.json ]; then
    cd /app/podnik && python manage.py loaddata /app/initial_fixtures.json
else
    echo "initial_fixtures.json not found"
fi
