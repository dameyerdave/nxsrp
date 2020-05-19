#!/usr/bin/env bash

envsubst '\$NGINX_SERVER_NAME \$BACKEND_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf 
nginx -g 'daemon off;'
