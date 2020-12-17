---
name: Monkey (UI/Application Exerciser) Notes
---
# Monkey Notes - UI/Application Exerciser Monkey
Link: https://developer.android.com/studio/test/monkey

The Monkey is a program that runs on your emulator or device and generates pseudo-random streams of user events such as clicks, touches, or gestures, as well as a number of system-level events. You can use the Monkey to stress-test applications that you are developing, in a random yet repeatable manner.

## Start monkey with package name
To start monkey using particular app name package: 
`adb shell monkey -p your.package.name -v 500`
