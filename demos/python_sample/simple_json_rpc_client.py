from jsonrpcclient.clients.http_client import HTTPClient
from jsonrpcclient.requests import Request
client = HTTPClient("http://localhost:8080/myobjectrpc")
resp = client.send(Request("subtract", 10, 3))
print(f"10 - 3 = {resp.data.result}")


