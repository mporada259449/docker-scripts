from dotenv import load_dotenv
from psycopg2 import connect
from sys import exit
import redis
import os

def check_postgres(host, port, user, dbname, password):
    try:
        print(host, port, user, dbname, password)
        conn = connect(
            host=host,
            port=port,
            user=user,
            dbname=dbname,
            password=password
        )
        print("Connection to postgresql succeded")
        conn.close()
        return True
    except:
        return False

def check_redis(url):
    try:
        conn = redis.Redis.from_url(url)
        conn.ping()
        print("Connection to redis succeded")
        return True
    except:
        return False

    
if __name__=="__main__":
    pg_isready = False
    redis_isready = False
    load_dotenv()
    host = os.environ.get("DBHOST") 
    port = os.environ.get("DBPORT") 
    user = os.environ.get("DBUSER") 
    dbname = os.environ.get("DBNAME") 
    password = os.environ.get("DBPASSWORD")
    redis_url = os.environ.get("REDISHOST")
    print(host, port, user, dbname, password)
    while not pg_isready or not redis_isready:
        pg_isready = check_postgres(host = host, 
                                    port = port,
                                    user = user,
                                    dbname = dbname,
                                    password = password )
        redis_isready = check_redis(redis_url)

    exit(0)
