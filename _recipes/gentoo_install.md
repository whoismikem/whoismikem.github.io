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
# Activate swap
swapon /dev/sda3
```
* Mount filesystems:
```
mount /dev/sda4 /mnt/gentoo
mkdir /mnt/gentoo/boot
mount /dev/sda2 /mnt/gentoo/boot
```
* Make sure system date/time is accurate: `date`
* Setup stage:
  * Choose a stage link from here: https://gentoo.org/downloads/
  * Download Stage: 
```
cd /mnt/getnoo
wget <stg_url>
```
  * Extract stage: `tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner`
  * Apped `MAKEOPTS="-j2"` to `/mnt/gentoo/etc/portage/make.conf`
  * Choose download mirror: `mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf`
  * Ebuilds repository: 
```
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
```
  * DNS Config: `cp --dereference /etc/resolv.conf /mnt/gentoo/etc/`
  * Mount necessary filesystems:
```
mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
```
  * Chroot to new environment:
```
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"
```
**NOTE**: If the Gentoo installation is interrupted anywhere after this point, it should be possible to 'resume' the installation at this step.
* Mount boot partition: `mount /dev/sda2 /boot`
* Portage config:
```
emerge-webrsync
# List news notifications
eselect news list
# Read news
eselect news read #
```
* Select profile:
```
eselect profile list
# Set profile to 'default/linux/amd64/17.1/desktop (stable)'
eselect profile set 20
```
* Updating the @world set. This takes a while: `emerge --ask --verbose --update --deep --newuse @world`




