---
name: Debian Notes
---

# Debian Notes

## Files / Directories
### Find files
`find <where> -name "<search string>"`


## Package Management
### Show installed packages that depend on a package
This will show you all the installed packages that have <package> as a dependency
`apt-cache --installed rdepends <package>

### List installed packages
`apt list --installed`
or
`dpkg -l`

### Search installed packages for file
`dpkg -S <file>`

### List files inside of package
`apt-file list <package_name>`

## Samba / File Share
### Set/Reset smb password
`smbpasswd -a <username>`

## Cross Packaging / Compiling
Debians support for multi architecture is there. Here are some tools.

### List current architecture
`dpkg --print-architecture`

### Add architecture
Example arch: `armhf`, `i386`
`dpkg --add-acrhitecture <arch>` 
Run `apt update` for changes to take

### Remove architeture
`dpkg --remove-architecture <arch>`
Run `apt update` for changes to take

## General Tasks
### Start GUI/X app over ssh
`export DISPLAY=:0` and start the gui app

### Links
* Filesystem Hierarchy Standard: <https://www.debian.org/doc/packaging-manuals/fhs/fhs-3.0.html>
* Debian New Maintainers' Guide: <https://www.debian.org/doc/manuals/maint-guide/index.en.html>
