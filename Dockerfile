FROM python:3.8-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
COPY * ./
CMD hypercorn main:app -b 0.0.0.0
