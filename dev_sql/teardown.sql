\connect financial;
DROP TABLE IF EXISTS snapshot.stock, snapshot.crypto, snapshot.forex;
DROP SCHEMA IF EXISTS snapshot CASCADE;
\connect postgres;
DROP DATABASE financial;