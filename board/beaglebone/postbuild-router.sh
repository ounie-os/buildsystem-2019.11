#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT="${BOARD_DIR}/init_scripts"
INIT_SCRIPT_ROUTER="${BOARD_DIR}/init_scripts_router"
BOA_ARIA2="${BOARD_DIR}/boa-AriaNg"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware
cp -ar ${INIT_SCRIPT}/* ${TARGET_DIR}/etc/init.d
cp -ar ${INIT_SCRIPT_ROUTER}/* ${TARGET_DIR}/etc/init.d
cp -ar ${BOARD_DIR}/dnsmasq.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/hostapd.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/hostapd-5g.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/udhcpd.conf ${TARGET_DIR}/etc/
cp -ar ${BOARD_DIR}/sysctl.conf ${TARGET_DIR}/etc/
cp -ar ${BOA_ARIA2}/ ${TARGET_DIR}/etc
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile

