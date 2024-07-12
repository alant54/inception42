#!/bin/bash

echo "Starting Redis..."
exec redis-server /etc/redis/redis.conf --requirepass $REDIS_PWD
