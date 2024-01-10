#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi

SCRIPT_DIR=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)
DOCKER_ENV_FILE="$SCRIPT_DIR/.env"

PUID=$(id -u)
PGID=$(id -g)
TZ="Europe/Berlin"

# zigbee2mqtt specific settings
ZIGBEE_DEVICE_PATH="/dev/serial/by-id/usb-ITead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_XXXXX-if00-port0"
# groupid for permission on device "$ZIGBEE_DEVICE_PATH"
# PGID_DIALOUT=20
GROUP_OWNER_NAME_ZIGBEE_DEVICE=$(stat -c '%G' -L "$ZIGBEE_DEVICE_PATH")
PGID_DIALOUT=$(cut -d: -f3 < <(getent group "$GROUP_OWNER_NAME_ZIGBEE_DEVICE"))

touch "$DOCKER_ENV_FILE"
chmod u=rw,g=,o= "$DOCKER_ENV_FILE"

{
    echo "PUID=$PUID"
    echo "PGID=$PGID"
    echo "PGID_DIALOUT=$PGID_DIALOUT"
    echo "TZ=$TZ"
    echo "ZIGBEE_DEVICE_PATH=$ZIGBEE_DEVICE_PATH"
} >"$DOCKER_ENV_FILE"
