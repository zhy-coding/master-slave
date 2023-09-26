#!/bin/bash


# 获取主mysql容器id
master_id=$(docker ps | grep "mysql-master" | awk '{print $1}')

# 执行容器内部脚本获取master-status
output=$(docker exec -it "$master_id" /bin/bash -c "/var/lib/shell/init_master.sh")

echo ""
# 获取binlog文件
binlog=$(echo "$output" | grep 'master-binlog' | awk '{print $1}')

echo "binlog is $binlog"
# 获取当前position
position=$(echo "$output" | grep 'master-binlog' | awk '{print $2}')

echo "position is $position"


slave_id=$(docker ps | grep "mysql-slave" | awk '{print $1}')

output=$(docker exec -it "$slave_id" /bin/bash -c "chmod 777 /var/lib/shell/init_slave.sh && /var/lib/shell/init_slave.sh $binlog $position")

echo "output is $output"

