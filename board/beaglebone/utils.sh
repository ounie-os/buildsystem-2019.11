#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
WIFI_SCRIPT="${BOARD_DIR}/init_scripts"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_SCRIPT}/* ${TARGET_DIR}/etc/init.d
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
