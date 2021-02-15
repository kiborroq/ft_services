#!/bin/sh

mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
/usr/bin/mysqld -u root & sleep 3

mysql -u root -e "CREATE DATABASE wordpress;CREATE USER 'kiborroq'@'%' IDENTIFIED BY 'kiborroq';GRANT ALL PRIVILEGES ON * . * TO 'kiborroq'@'%';FLUSH PRIVILEGES;"
mysql -uroot  wordpress < wordpress.sql

supervisord -c /etc/supervisord.conf

sleep infinity