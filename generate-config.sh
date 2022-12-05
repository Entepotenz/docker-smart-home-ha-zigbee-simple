#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset
if [[ "${TRACE-0}" == "1" ]]; then set -o xtrace; fi

readonly SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
readonly DOCKER_ENV_FILE="$SCRIPT_DIR/.env"

readonly PUID=$(id -u)
readonly PGID=$(id -g)
readonly TZ="Europe/Berlin"

# zigbee2mqtt specific settings
# groupid for permission on device "/dev/ttyUSB0"
readonly PGID_DIALOUT=20

touch "$DOCKER_ENV_FILE"
chmod u=rw,g=,o= "$DOCKER_ENV_FILE"

{
    echo "PUID=$PUID"
    echo "PGID=$PGID"
    echo "PGID_DIALOUT=$PGID_DIALOUT"
    echo "TZ=$TZ"
} > "$DOCKER_ENV_FILE"