#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
INIT_SCRIPT="${BOARD_DIR}/init_scripts"
INIT_SCRIPT_BT="${BOARD_DIR}/init_scripts_bt"
BOA_ARIA2="${BOARD_DIR}/boa-AriaNg"
CROND="${BOARD_DIR}/cron.d"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware
cp -ar ${INIT_SCRIPT}/* ${TARGET_DIR}/etc/init.d
cp -ar ${INIT_SCRIPT_BT}/* ${TARGET_DIR}/etc/init.d
cp -ar ${BOA_ARIA2}/ ${TARGET_DIR}/etc
cp -ar ${CROND}/* ${TARGET_DIR}/etc/cron.d
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
