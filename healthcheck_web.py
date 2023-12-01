from requests import get, ConnectTimeout
from sys import exit
try:    
    response = get("http://127.0.0.1:8000", timeout=5)
except ConnectTimeout:
    exit(1)
    
if response.status_code==200:
    exit(0)
else:
    exit(1)
