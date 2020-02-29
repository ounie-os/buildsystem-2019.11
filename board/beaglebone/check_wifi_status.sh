#! /bin/sh

ifconfig wlan0 | grep RUNNING
[ $? = 0 ] || $1 $2

