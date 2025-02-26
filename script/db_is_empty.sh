#!/bin/sh

# Check if there are any tables in the database
TABLE_COUNT=$(PGPASSWORD=$POSTGRES_PASSWORD psql -h podnik_db -U $POSTGRES_USER -d $POSTGRES_DB -t -c "SELECT count(*) FROM information_schema.tables WHERE table_schema = 'public';")

if [ "$TABLE_COUNT" -eq 0 ]; then
  exit 0  # Database is empty, load data
else
  exit 1  # Database is not empty, skip loading data
fi
