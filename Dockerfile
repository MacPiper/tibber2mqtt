FROM python:3
WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip3 install --no-cache-dir -r requirements.txt

ENV PYTHONUNBUFFERED=1
CMD [ "python3", "./tibber2mqtt/tibber2mqtt.py","--config","./config/config.yaml"]
