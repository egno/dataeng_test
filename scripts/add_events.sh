#!/bin/bash

echo "Append events ..."

/usr/bin/mysql -hdb -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE} < ./sql/add_events.sql 

echo "Done"