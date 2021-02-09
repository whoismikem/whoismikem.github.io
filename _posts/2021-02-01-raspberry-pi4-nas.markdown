---
layout: post
title:  "Raspberry Pi 4 Network Attached Storage"
categories: raspberrypi pi4 nas
tags: raspberrypi pi4 nas
---

# Description
Simpl Network Attached Storage (NAS) setup running on Rapberry Pi4 with software RAID-0 Mirror on two USB3.0 Hard Drives for data redundancy in case of single disk failure. Perfect for low profile basic storage solution.

# Things you need
* Raspberry Pi4 - 4GB Ram
  - Raspberry Pi OS Lite
  -  16 GB MicroSD card
  -  Protective Case. These [here](https://www.amazon.com/ZkeeShop-Raspberry-Aluminum-Cooling-Compatible/dp/B07YG6CXXV/ref=sr_1_1?dchild=1&keywords=ZkeeShop+for+Raspberry+Pi+4+Armor+Aluminum+Alloy+Case&qid=1612191727&s=electronics&sr=1-1) are great 
* [OpenMediaVault](https://www.openmediavault.org/)

# Steps
1. Flash SD Card with [Raspberry Pi OS Lite](https://www.raspberrypi.org/software/operating-systems/#raspberry-pi-os-32-bit)
2. Boot the Pi and gain ssh access.
3. Install OpenMediaVault using install script from [here](https://github.com/OpenMediaVault-Plugin-Developers/installScript) **NOTE:** Downloading and running a bash script from the internet can be dangerous. When in doubt, review and understand the script before executing this command.
    * Extra documentation [Installing OMV on Raspberry Pi](https://github.com/OpenMediaVault-Plugin-Developers/docs/blob/master/Adden-B-Installing_OMV5_on_an%20R-PI.pdf)
4. Set static IP
