#!/bin/bash

echo "Init mysql ..."

/usr/bin/mysql -hdb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ./sql/init_mysql.sql 
/usr/bin/mysql -hdb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ./sql/add_data.sql 

echo "Init clickhouse ..."

/usr/bin/clickhouse-client -h clickhouse --multiquery < ./sql/init_ch.sql

echo "Done"