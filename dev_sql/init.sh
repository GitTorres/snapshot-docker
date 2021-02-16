echo 'instantiating db'
psql postgresql://postgres:tsunami@timescaledb:5432/financial -f /usr/src/app/tsdbinit.sql