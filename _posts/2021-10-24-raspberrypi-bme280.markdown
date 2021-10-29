---
layout: post
title:  "Raspberry Pi BME280 - Temp/Humidity/Pressure Sensor Setup"
categories: raspberrypi pi bme280
tags: raspberrypi pi bme280
---

# Description
Setup raspberry pi with bme280 environment sensor


# Install Steps
1. Flash SD Card with [Raspberry Pi OS Lite](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)
2. Boot the Pi and gain ssh access.
3. Setup python3 environment
```
sudo apt install python3-pip
sudo apt install python3-smbus
```
4. Install i2c tools `sudo apt install i2c-tools`
5. Install python module for bme280 sensor: `python3 -m pip install RPi.bme280`
6. Enable the i2c interface 
```
sudo raspi-config
Interface Options > I2C 
```

# Test Sensor Connectivity
* Check if the sensor is recognized: `sudo i2cdetect -y 1`  
Expected output:
```
     0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
00:          -- -- -- -- -- -- -- -- -- -- -- -- -- 
10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 
70: -- -- -- -- -- -- -- 77  
```

* Check python module script reads sensor data
```
cd ~/.local/bin
python3 ./read_bme280 --i2c-address 0x77
```

# Example Script
```
import bme280
import smbus2

port = 1
address = 0x77
bus = smbus2.SMBus(port)

bme280.load_calibration_params(bus, address)
bme280_data = bme280.sample(bus, address)
print(bme280_data)