# Builder stage
FROM python:3.9-slim as builder

COPY requirements.txt .

RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Final stage
FROM python:3.9-slim

WORKDIR /app

COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages

COPY app/ ./

CMD ["python3", "./main.py"]
