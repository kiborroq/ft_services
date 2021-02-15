#!/bin/sh

/usr/sbin/influxd & sleep 3

influx -execute "CREATE DATABASE grafana"
influx -execute "CREATE USER kiborroq WITH PASSWORD 'kiborroq'"
influx -execute "GRANT ALL ON grafana TO kiborroq"

supervisord -c /etc/supervisord.conf

sleep infinity