#!/bin/sh

mysql_install_db -u root --datadir=/var/lib/mysql
/usr/bin/mysqld -u root --pid-file=/run/mysqld/mysqld.pid & sleep 3

mysql -u root -e "CREATE DATABASE wordpress;CREATE USER 'kiborroq'@'%' IDENTIFIED BY 'kiborroq';GRANT ALL PRIVILEGES ON * . * TO 'kiborroq'@'%';FLUSH PRIVILEGES;"
mysql -u root wordpress < wordpress.sql

kill $(cat /run/mysqld/mysqld.pid) & sleep 3

supervisord -c /etc/supervisord.conf