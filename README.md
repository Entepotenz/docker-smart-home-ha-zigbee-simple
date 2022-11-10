# Simple docker setup of HomeAssistant with Zigbee2Mqtt

This is intended as a solid starting point to get your smart-home running :-)

**Warning**: At the time of writing the frontend of zigbee2mqtt does not offer a simple way to configure authentication. I recommend to put a reverse proxy in front of it to add minimum access protection by providing HTTP Basic Auth.

# Features
- HomeAssistant using the image provided by linuxserver.io
    - https://hub.docker.com/r/linuxserver/homeassistant
- Zigbee2Mqtt
    - https://www.zigbee2mqtt.io/guide/installation/02_docker.html
- Mosquitto
    - https://hub.docker.com/_/eclipse-mosquitto
- Watchtower (for automatically updating your containers)
    - https://containrrr.dev/watchtower/