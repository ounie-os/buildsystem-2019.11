#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT_ROUTER="${BOARD_DIR}/init_scripts_router"
BOA_ARIA2="${BOARD_DIR}/boa-AriaNg"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware
cp -ar ${BOARD_DIR}/hostapd.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/hostapd-5g.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/sysctl.conf ${TARGET_DIR}/etc/
cp -ar ${BOA_ARIA2}/ ${TARGET_DIR}/etc
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile

mkdir -p ${TARGET_DIR}/etc/default
cp -ar ${INIT_SCRIPT_ROUTER}/dhcpd ${TARGET_DIR}/etc/default/
cp -ar ${INIT_SCRIPT_ROUTER}/dhcpd.conf ${TARGET_DIR}/etc/dhcp/
cp -ar ${INIT_SCRIPT_ROUTER}/bin/natScript ${TARGET_DIR}/usr/sbin/natScript
cp -ar ${INIT_SCRIPT_ROUTER}/journald.conf ${TARGET_DIR}/etc/systemd/
cp -ar ${INIT_SCRIPT_ROUTER}/resolved.conf ${TARGET_DIR}/etc/systemd/
cp -ar ${INIT_SCRIPT_ROUTER}/named.conf ${TARGET_DIR}/etc/

cp -ar ${INIT_SCRIPT_ROUTER}/service/* ${TARGET_DIR}/usr/lib/systemd/system/

SERVICES="eth0-static mountdisk nat wifi"
for x in ${SERVICES}
do
ln -sf /usr/lib/systemd/system/${x}.service \
	${TARGET_DIR}/etc/systemd/system/multi-user.target.wants/${x}.service
done
