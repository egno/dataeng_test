#!/bin/bash

/usr/bin/clickhouse-client -h clickhouse --multiquery < ./sql/user_actions.sql