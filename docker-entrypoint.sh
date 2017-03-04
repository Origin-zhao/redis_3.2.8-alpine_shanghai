#!/bin/sh
echo 511 > /proc/sys/net/core/somaxconn
echo "vm.overcommit_memory = 1" > /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/enabled
sysctl -p

set -e

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	chown -R redis .
	exec su-exec redis "$0" "$@"
fi

exec "$@"
