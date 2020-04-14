#!/bin/bash
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" -d "$POSTGRES_DB"  <<-EOSQL
     create table todos (
        id serial primary key,
        done boolean not null default false,
        task text not null,
        due timestamptz
     );
     INSERT INTO todos VALUES (1, true, 'TODO-1', now());
EOSQL