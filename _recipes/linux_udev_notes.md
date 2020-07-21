---
name: Linux UDEV Notes
---

# UDEV Notes

## Grant Permission to USB Device
Find the device vendor id and product it
`lsusb -v`

Add a new rules file, usually under `/etc/udev/rules.d/`.
File name needs to be XX-<rule name>.rules. Where XX is priority number, high number is higer priority. Example:  
`SUBSYSTEM=="usb", ATTRS{idVendor}=="1e4e", ATTRS{idProduct}=="0100", MODE="0666"`
Unplug the device and plug it back in.

## Monitor UDev
`udevadm monitor -u`
