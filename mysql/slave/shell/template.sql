
change master to master_host='mysql-master',
    master_user='root',master_password='123456',
    master_port=3306, master_log_file='@master_binlog',
    master_log_pos=@master_pos;

start slave;

show slave status \G;