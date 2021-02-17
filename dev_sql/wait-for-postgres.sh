#!/bin/sh
# wait-for-postgres.sh

set -e
  
shift
cmd="$@"
  
until PGPASSWORD=$POSTGRES_PASSWORD psql -h $DB_HOST_NAME -U "postgres"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
eval bash $1