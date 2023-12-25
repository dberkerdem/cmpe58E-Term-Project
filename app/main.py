from fastapi import FastAPI
import socket

hostname = socket.gethostname()
app = FastAPI()


@app.get("/")
def read_root():
    return {"message": f"Hello World from {hostname}. (v2)"}

AWS_SECRET_ACCESS_KEY = "heee"