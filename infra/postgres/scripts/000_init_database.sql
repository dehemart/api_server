CREATE SCHEMA IF NOT EXISTS api_server_db_scheme;
CREATE EXTENSION IF NOT EXISTS citext SCHEMA api_server_db_scheme;
ALTER DATABASE api_server_db
SET search_path TO "$user",
    public,
    extensions;