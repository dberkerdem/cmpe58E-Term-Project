from fastapi import FastAPI
import socket

hostname = socket.gethostname()
app = FastAPI()
AWS_ACCESS_KEY_ID = "AKIAIOSFODNN7E5ASPSE"
AWS_SECRET_ACCESS_KEY = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"

@app.get("/")
def read_root():
    return {"message": f"Hello World from {hostname}. (v2)"}

AWS_SECRET_ACCESS_KEY = "heee"