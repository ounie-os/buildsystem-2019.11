#!/bin/sh

set -u
set -e

BOARD_DIR="$(dirname $0)"
WIFI_FIRMWARE="${BOARD_DIR}/rtlwifi"
WIFI_SCRIPT="${BOARD_DIR}/init_scripts"

mkdir -p ${TARGET_DIR}/lib/firmware
cp -ar ${WIFI_FIRMWARE} ${TARGET_DIR}/lib/firmware/
cp -ar ${WIFI_SCRIPT}/* ${TARGET_DIR}/etc/init.d/
cp -ar ${BOARD_DIR}/dnsmasq.conf ${TARGET_DIR}/etc/
mkdir -p ${TARGET_DIR}/etc/docker
cp -ar ${BOARD_DIR}/daemon.json ${TARGET_DIR}/etc/docker/
sed -i "5s/'# '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile
sed -i "7s/'$ '/'\\\u@\\\h:\\\w\\\\$ '/g" ${TARGET_DIR}/etc/profile

if [ -e ${TARGET_DIR}/etc/init.d/S60dockerd ]; then
  mv ${TARGET_DIR}/etc/init.d/S60dockerd ${TARGET_DIR}/etc/init.d/S98dockerd
fi
