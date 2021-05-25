#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT_SERVICE="${BOARD_DIR}/init_systemd/service"
INIT_SCRIPT_BIN="${BOARD_DIR}/init_systemd/bin"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware/

mkdir -p ${TARGET_DIR}/etc/docker
cp -ar ${BOARD_DIR}/daemon.json ${TARGET_DIR}/etc/docker/

cp -ar ${BOARD_DIR}/journald.conf ${TARGET_DIR}/etc/systemd/

cp -ar ${INIT_SCRIPT_SERVICE}/* ${TARGET_DIR}/usr/lib/systemd/system/
cp -ar ${INIT_SCRIPT_BIN}/* ${TARGET_DIR}/usr/bin/
SERVICES="ze08-iot usbgadget mountdisk mqtt-jetlinks gpio dbus-session coap-server shtc1 wpa_supplicant-nl80211"
for x in ${SERVICES}
do
ln -sf /usr/lib/systemd/system/${x}.service \
	${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/${x}.service
done
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
