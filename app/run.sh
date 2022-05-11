#!/bin/bash

# variabvles
FLASK_APP_PORT = 8000
WORKERS = 4
CERT = /app/conf/app.crt 
KEY = /app/conf/app.key


echo "[INFO] waiting..."
sleep 5

cd app/src
echo "[INFO] Loading..."

gunicorn \
--bind 0.0.0.0:${FLASK_APP_PORT} \
--workers ${WORKERS} \
--certfile ${CERT} \
--keyfile ${KEY} \
--reload server:app