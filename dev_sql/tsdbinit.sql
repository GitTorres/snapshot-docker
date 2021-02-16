SELECT 'CREATE DATABASE financial'
WHERE NOT EXISTS (SELECT FROM pg_database WHERE datname = 'financial')\gexec
CREATE EXTENSION IF NOT EXISTS timescaledb WITH SCHEMA financial CASCADE;

\connect financial;

CREATE TABLE IF NOT EXISTS "snapshot"(
  id SERIAL,
  ticker TEXT NOT NULL,
  market TEXT,
  updated NUMERIC,
  ts TIMESTAMP WITHOUT TIME ZONE NOT NULL,
  av NUMERIC,
  o NUMERIC NOT NULL,
  h NUMERIC NOT NULL,
  l NUMERIC NOT NULL,
  c NUMERIC NOT NULL,
  v NUMERIC,
  vw NUMERIC);

SELECT create_hypertable('snapshot', 'ts', if_not_exists => TRUE);
