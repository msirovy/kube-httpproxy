#!/bin/sh

exec /usr/local/bin/confd -node ${ETCD_NODES} &

[ -e /run/nginx.pid ] && kill `cat /run/nginx.pid`
nginx &

