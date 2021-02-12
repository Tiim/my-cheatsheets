# Wordpress

## Local Dev Env

### File Structure
```
+ php
  - Dockerfile
+ wp
  - (wordpress files currently working on)
+ wp_dump
  - (wordpress files dump)
- dump.sql
- docker-compose.yml
```

### Files

```yml
# docker-compose.yml
version: "3"
services:
  db:
    image: mysql:5.6.36
    ports:
      - "8081:3306"
    environment:
      MYSQL_ROOT_PASSWORD: ROOTPWD
      MYSQL_USER: MYUSER
      MYSQL_PASSWORD: MYPASSWORD
    volumes:
      - ./dump.sql:/docker-entrypoint-initdb.d/dump.sql
  wp:
    hostname: scbirs.local
    build: ./php
    volumes:
      - ./wp:/var/www/html
    ports:
      - "8080:80"
    links:
      - db:mysql
    depends_on:
      - db

  phpmyadmin:
    image: phpmyadmin
    container_name: phpmyadmin
    environment:
      PMA_HOST: db
      PMA_PORT: 3306
      PMA_USER: root
      PMA_PASSWORD: ROOTPWD

    restart: always
    ports:
     - 8082:80
    volumes:
     - /sessions
    links:
      - db:db
    depends_on:
      - db
```

```Dockerfile
# php/Dockerfile
FROM php:7.1-apache
RUN docker-php-ext-install mysqli pdo pdo_mysql
```

```php
define('FORCE_SSL_ADMIN',   false);
define('FORCE_SSL_LOGIN',   false);
define('FORCE_SSL_CONTENT', false);

define('WP_HOME','http://localhost:8080');
define('WP_SITEURL','http://localhost:8080');
```
