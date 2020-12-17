---
name: ADB Notes
---

# ADB Notes

## List installed package names
This will list all package names on the device:
`adb shell pm list packages`

Full path package names:
`adb shell pm list packages -f`


## Start App
To start app though adb command:
`adb shell am start -n <package_name>/<activity_name>`

## Get package name of running app
To get the package name of a running application:
`adb shell dumpsys window windows | grep -E 'mFocusedApp'`

adb shell
dumpsys package | grep -Eo "^[[:space:]]+[0-9a-f]+[[:space:]]+com.symbol.wfc.voice/[^[:space:]]+" | grep -oE "[^[:space:]]+$"