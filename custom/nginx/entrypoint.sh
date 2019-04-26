#!/usr/bin/env bash

sed "s/APP_NAME/$APP_NAME/g" /etc/nginx/conf.d/default.conf > /tmp/new.conf
cp /tmp/new.conf /etc/nginx/conf.d/default.conf
sed "s/PUB_NAME/$PUB_ADDR/g" /etc/nginx/conf.d/default.conf > /tmp/new.conf
cp /tmp/new.conf /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
