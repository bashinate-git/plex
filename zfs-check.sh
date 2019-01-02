#!/bin/bash
EMAIL_ADD=@mms.cricketwireless.net

checkstatus=$(zpool status -x | grep 'all pools are healthy')

if [ "$checkstatus" != 'all pools are healthy' ]; then
    /bin/date > /tmp/zfs.stat
    echo >> /tmp/zfs.stat
    /bin/hostname >> /tmp/zfs.stat
    echo >> /tmp/zfs.stat
    /sbin/zpool status -x >> /tmp/zfs.stat
    cat /tmp/zfs.stat | /usr/bin/mail -s "Disk failure in server : `hostname`" $EMAIL_ADD
fi
