CREATE USER 'root'@'slave' IDENTIFIED BY '123456';
grant replication slave, replication client on *.* to 'root'@'slave';