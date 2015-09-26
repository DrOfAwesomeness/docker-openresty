#!/bin/sh
echo "$@"

useradd -m -m -d /var/www nginx
chown -R nginx:nginx /etc/nginx

exec "$@"
