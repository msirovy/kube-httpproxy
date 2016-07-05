#!/bin/sh

#[ -e /run/nginx.pid ] && kill `cat /run/nginx.pid`
#nginx &
#
/usr/local/bin/confd -node ${ETCD_NODES}

sleep 10
