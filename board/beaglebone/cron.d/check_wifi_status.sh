#! /bin/sh

INTERFACE=wlan0

/etc/cron.d/ping.sh
# ifconfig wlan0 | grep RUNNING
# [ $? = 0 ] || $1 $2
if [ $? != 0 ]; then
  kill -15 $(pidof wpa_supplicant)
  while true
  do
    if [ -e /var/run/wpa_supplicant ]; then
      sleep 1
    else
      break
    fi
  done
  wpa_supplicant -s -B -Dnl80211 -i${INTERFACE} -c/etc/wpa_supplicant.conf
  while true
  do
    ifconfig ${INTERFACE} | grep RUNNING
    if [ $? = 0 ]; then
      break
    fi
    sleep 1
  done
  kill -10 $(pidof udhcpc)
fi

