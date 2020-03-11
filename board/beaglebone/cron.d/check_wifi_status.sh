#! /bin/sh

/etc/cron.d/ping.sh
# ifconfig wlan0 | grep RUNNING
[ $? = 0 ] || $1 $2

