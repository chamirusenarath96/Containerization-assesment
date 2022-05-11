#!/bin/bash

echo "[INFO] waiting..."
sleep 5

nginx -c /etc/nginx/nginx.conf -g 'daemon off;'