---
name: Gentoo Install
---

# Gentoo Install - Virtual Box

* Add user account: `useradd -m -G users <username>`
* Start sshd: `rc-service sshd start`

* List disks attached: `lsblk`
* Partition the disk: `parted -a optimal /dev/sda`
  * Set GPT label: `mklabel gpt`
  * List partitions: `print`
  * Remove partitions where <part_num> is number of partition: `rm <part_num>` 
  * Set unit: `unit mib`
  * Create first partition:  
```
mkpart primary 1 3
name 1 grub
set 1 bios_grub on
```
  * Create third (swap) partition:
```
mkpart primary 131 1643
name 3 swap
```
  * Create fourth (root) partition:
```
mkpart primary 1643 -1
name 4 rootfs
``` 
* Create Filesystem - Format as ext4:
```
kfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda4
mkswap /dev/sda3
swapon /dev/sda3
