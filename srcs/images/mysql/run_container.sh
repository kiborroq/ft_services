#!/bin/sh
# rc-status -a
# touch /run/openrc/softlevel

# mysql_install_db -u root --datadir=/var/lib/mysql
# /usr/bin/mysqld -u root --datadir=/var/lib/mysql --pid-file=/run/mysqld/mysqld.pid & sleep 3

# rc-service mariadb start

# mysql -u root -e "CREATE DATABASE wordpress; CREATE USER 'kiborroq'@'%' IDENTIFIED BY 'kiborroq'; GRANT ALL PRIVILEGES ON wordpress . * TO 'kiborroq'@'%'; FLUSH PRIVILEGES;"
# mysql -u root  wordpress < wordpress.sql

mysql_install_db -u root --datadir=/var/lib/mysql
/usr/bin/mysqld -u root & sleep 3

mysql -u root -e "CREATE DATABASE wordpress;CREATE USER 'kiborroq'@'%' IDENTIFIED BY 'kiborroq';GRANT ALL PRIVILEGES ON * . * TO 'kiborroq'@'%';FLUSH PRIVILEGES;"
mysql -uroot  wordpress < wordpress.sql

supervisord -c /etc/supervisord.conf

sleep infinity