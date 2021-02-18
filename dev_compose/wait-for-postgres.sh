set -e
 
until PGPASSWORD=$POSTGRES_PASSWORD psql -h $DB_HOST_NAME -U "postgres"; do
  >&2 echo "Postgres is unavailable - sleeping"
  sleep 1
done
  
>&2 echo "Postgres is up - executing command"
eval $1 $2
