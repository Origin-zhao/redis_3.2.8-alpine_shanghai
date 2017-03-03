#!/bin/sh
echo 512 > /proc/sys/net/core/somaxconn
echo "vm.overcommit_memory=1" > /etc/sysctl.conf
echo never > /sys/kernel/mm/transparent_hugepage/enabled
