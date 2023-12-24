# Builder Stage
FROM python:3.8 AS builder

WORKDIR /build

RUN python3 -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# Final Stage
FROM python:3.8-slim-bookworm

WORKDIR /app

COPY --from=builder /opt/venv /opt/venv

# Activate virtual environment
ENV PATH="/opt/venv/bin:$PATH"
COPY app/ ./

EXPOSE 5000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0","--port", "5000"]
