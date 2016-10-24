# rpi-openhab

Raspberry PI 2 compatible Docker image with OpenHAB 1.8.3

- Fork History:
  - Forked from [dhermanns/rpi-openhab](https://hub.docker.com/r/dhermanns/rpi-openhab/)
    - Updated to usedordoka/rpi-java8 as the base image for the raspberry pi.
  - Which was forked from sshcheung/rpi-openhab
  - Which was forked from tdeckers/openhab
- Note: I'm running the docker container using the excellent [Hypriot Base Image](http://blog.hypriot.com/downloads/).
  - With this image you get the basic docker 1.9 support that you need.

### Preparation

- 1. Place your specific Openhab configuration in /home/pi/openhab directory.
  - Add your addons configuration to a special `addons.cfg` file e.g. with the following content:

```
org.openhab.binding.http
org.openhab.persistence.logging
org.openhab.action.homematic
org.openhab.binding.networkhealth
org.openhab.persistence.rrd4j
org.openhab.binding.exec
org.openhab.binding.ntp
org.openhab.binding.homematic
org.openhab.persistence.exec
```

- 2. To set e.g. the german timezone, place a file `timezone` to your configuration directory `/home/pi/openhab` with the following content:
```
Europe/Berlin
```

- 3. Place everything else you normally put into the openhab configuration directory to `/home/pi/openhab` too.

### Running

- Configuration directory is expected to be mounted as a volume from the host to `/etc/openhab` in the container.
- Example run command:

```sh
docker run -d --name openhab -p 8080:8080 -v /home/pi/openhab:/etc/openhab --net host dhermanns/rpi-openhab
```

### Troubleshooting

- An easy way to find out what's going on is to simply use `docker exec` and have a look at the `openhab.log` file:

```
docker exec openhab cat /opt/openhab/logs/openhab.log
```

### License

The MIT License (MIT)
