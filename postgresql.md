# Postgresql

## Accessing Postgresql cli inside a docker container

[Source](https://github.com/Radu-Raicea/Dockerized-Flask/wiki/%5BDocker%5D-Access-the-PostgreSQL-command-line-terminal-through-Docker)

* Starting docker `docker-compose up --build`
* Find docker container name of postgres container: `docker ps --format '{{.Names}}' | grep postgres`
* Enter postgres container `docker exec -it postgres-container psql -U postgres`
* OR EASYER: `docker exec -it $(docker ps --format '{{.Names}}' | grep postgres) psql -U postgres`
* Connect `\c <database_name>`
* List tables `\d`
* List table `\d+ <table_name>`
* Exit `\q`

## Syntag

### Insert or Update (Upsert)

Use `ON CONFLICT ("rownameOfConflictingKey") DO UPDATE SET "row" = EXCLUDED."row"`

Example
```sql
INSERT INTO goal ("groupLevel", "desc")
      VALUES (?, ?)
      ON CONFLICT ("groupLevel")
      DO UPDATE SET "desc" = EXCLUDED."desc"
```

### Delete

Ordinary delete:
```sql
DELETE FROM "table"
WHERE "table"."id" = ? AND …
```

With a joined table:

```sql
DELETE FROM "table"
USING "another_table"
WHERE "table"."id" = "another_table"."id" AND …
```
