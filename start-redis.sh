#/bin/sh
cd /run/secrets/
redis-server *:6379 --requirepass $(cat REDISPASS) 
cd /data