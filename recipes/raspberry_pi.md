---
name: Raspberry Pi Notes
---

# Environment Sensor
* Based on Raspberry Pi 4 and using the following components: bme280
* Container solution using docker
* Exposing data via API built with python3, flask

### Setup Python
https://pypi.org/project/RPi.bme280/

* Uninstall python2
* Install modules: `pip3 install RPi.bme280`

### Packages
Install the following packages: `apt install i2c-tools python3-pip`
