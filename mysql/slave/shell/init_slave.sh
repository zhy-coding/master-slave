#bin/bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 arg1 arg2"
  exit 1
fi



export MASTER_BINLOG="$1"
export MASTER_POSITION=$(("$2"))
MYSQL_USER="root"
MYSQL_PASSWORD="123456"


sed -e 's/@master_binlog/'"$MASTER_BINLOG"'/g' -e 's/@master_pos/'"$MASTER_POSITION"'/g' /var/lib/shell/template.sql > /var/lib/shell/completion.sql

mysql -u$MYSQL_USER -p$MYSQL_PASSWORD -S /var/lib/mysql/mysqld.sock < /var/lib/shell/completion.sql

rm /var/lib/shell/completion.sql