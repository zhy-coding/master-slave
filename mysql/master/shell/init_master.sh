#bin/bash

MYSQL_USER="root"
MYSQL_PASSWORD="123456"

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -S /var/lib/mysql/mysqld.sock < /var/lib/shell/template.sql

