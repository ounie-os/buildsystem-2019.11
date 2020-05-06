#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT="${BOARD_DIR}/init_scripts"
INIT_SCRIPT_OPENCV="${BOARD_DIR}/init_scripts_opencv"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware
cp -ar ${INIT_SCRIPT}/* ${TARGET_DIR}/etc/init.d
cp -ar ${INIT_SCRIPT_OPENCV}/* ${TARGET_DIR}/etc/init.d
cp -ar ${BOARD_DIR}/dnsmasq.conf ${TARGET_DIR}/etc/
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile

