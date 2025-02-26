#!/bin/sh

until PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -c '\q'; do
  >&2 echo "Waiting for Postgres..."
  sleep 1
done
>&2 echo "Postgres is up"
