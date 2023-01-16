# Simple docker setup of HomeAssistant with Zigbee2Mqtt

This is intended as a solid starting point to get your smart-home running :-)

**Warning**: At the time of writing the frontend of zigbee2mqtt does not offer a simple way to configure authentication. I recommend to put a reverse proxy in front of it to add minimum access protection by providing HTTP Basic Auth.

## Features
- HomeAssistant using the image provided by linuxserver.io
  - [https://hub.docker.com/r/linuxserver/homeassistant](https://hub.docker.com/r/linuxserver/homeassistant)
- Zigbee2Mqtt
  - [https://www.zigbee2mqtt.io/guide/installation/02_docker.html](https://www.zigbee2mqtt.io/guide/installation/02_docker.html)
- Mosquitto
  - [https://hub.docker.com/_/eclipse-mosquitto](https://hub.docker.com/_/eclipse-mosquitto)
- Watchtower (for automatically updating your containers)
  - [https://containrrr.dev/watchtower/](https://containrrr.dev/watchtower/)

## How to use

1. check which path your zigbee adapter has
    - e.g. `/dev/serial/by-id/usb-ITead_Sonoff_Zigbee_3.0_USB_Dongle_Plus_XXXXX-if00-port0`
    - e.g. this command to find the device `ls /dev/serial/by-id/*igbee*`
1. assign variable `ZIGBEE_DEVICE_PATH`
1. run `generate-config.sh`
    - this scripts generates the `.env` file which will provide the environment variables for docker-compose.yml
1. run `docker-compose up -d`
1. happy smart home hacking :rocket: