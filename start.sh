#!/bin/sh

exec /usr/local/bin/confd -host ${ETCD_NODES}
