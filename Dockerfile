FROM python:3 AS builder

WORKDIR /app

COPY requirements.txt ./
RUN pip wheel --no-cache-dir --wheel-dir /app/wheels -r requirements.txt

FROM python:3-slim
WORKDIR /usr/src/app

COPY --from=builder /app/wheels /wheels
COPY --from=builder /app/requirements.txt .
RUN pip install --no-cache /wheels/*


ENV PYTHONUNBUFFERED=1
CMD [ "python3", "./tibber2mqtt/tibber2mqtt.py","--config","./config/config.yaml"]
