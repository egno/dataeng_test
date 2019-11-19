#!/bin/bash

/usr/bin/clickhouse-client -h clickhouse --multiquery < ./sql/collect.sql