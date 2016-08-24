#!/bin/bash
#
# Dumps the MySQL and Mongo dbs to /tmp/databases.
# This is executed before Abyss backs this up.

set -euo pipefail


## Dump Mongo dbs

mkdir -p /tmp/database_dumps/mongoid
cd /tmp/database_dumps/mongoid

mongodump



## Dump MySQL dbs

mkdir -p /tmp/database_dumps/mysql
cd /tmp/database_dumps/mysql

# Set default file permissions
umask 0077

# Get list of databases
DATABASES=$(mysql -e "SHOW DATABASES;" -s | tail -n +1 | grep -v information_schema)

# Backup each MySQL database
for db in $DATABASES; do
      mysqldump --skip-lock-table $db > $db.sql
done

