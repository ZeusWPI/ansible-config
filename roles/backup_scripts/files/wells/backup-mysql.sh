#!/bin/bash

# set default file permissions
umask 0077

# get list of databses
DATABASES=$(mysql -e "SHOW DATABASES;" -s | tail -n +1 | grep -v information_schema)

# backup each database
for db in $DATABASES; do
	mysqldump --skip-lock-table $db > /etc/databases/$db.sql
done

