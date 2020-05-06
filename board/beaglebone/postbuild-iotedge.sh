#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT="${BOARD_DIR}/init_systemd"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware/

mkdir -p ${TARGET_DIR}/etc/docker
cp -ar ${BOARD_DIR}/daemon.json ${TARGET_DIR}/etc/docker/

cp -ar ${INIT_SCRIPT}/usbgadget ${TARGET_DIR}/usr/bin/
cp -ar ${BOARD_DIR}/journald.conf ${TARGET_DIR}/etc/systemd/

cp -ar ${INIT_SCRIPT}/usbgadget.service ${TARGET_DIR}/usr/lib/systemd/system/
ln -sf /usr/lib/systemd/system/usbgadget.service \
	${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/usbgadget.service
cp -ar ${INIT_SCRIPT}/mountdisk.service ${TARGET_DIR}/usr/lib/systemd/system/
ln -sf /usr/lib/systemd/system/mountdisk.service \
	${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/mountdisk.service
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
