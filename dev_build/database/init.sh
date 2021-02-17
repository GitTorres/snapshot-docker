set -e

echo '===db init started==='
 
until PGPASSWORD=$POSTGRES_PASSWORD psql -h $DB_HOST_NAME -U "postgres"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
eval psql postgresql://postgres:$POSTGRES_PASSWORD@$DB_HOST_NAME:5432 -f init.sql

echo '===db init complete==='