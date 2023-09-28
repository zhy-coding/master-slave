#!/bin/bash


master_id=$(docker ps | grep "mysql-master" | awk '{print $1}')

output=$(docker exec -it "$master_id" /bin/bash -c "/var/lib/shell/init_master.sh")

binlog=$(echo "$output" | grep 'master-binlog' | awk '{print $1}')

position=$(echo "$output" | grep 'master-binlog' | awk '{print $2}')

slave_id=$(docker ps | grep "mysql-slave" | awk '{print $1}')

output=$(docker exec -it "$slave_id" /bin/bash -c "chmod 777 /var/lib/shell/init_slave.sh && /var/lib/shell/init_slave.sh $binlog $position")


