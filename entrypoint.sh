#!/bin/bash

set -e

function stop() {
    pid=`cat /run/apache2/httpd.pid`

    kill -WINCH $pid

    sleep 2

    kill -TERM $pid

    exit 0
}

trap stop SIGTERM

rm -rf /run/apache2/*

rm -rf /var/run/apache2/*

exec /usr/sbin/httpd -DFOREGROUND &

wait