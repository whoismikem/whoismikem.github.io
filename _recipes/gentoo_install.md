---
name: Gentoo Install
---

# Gentoo Install - Virtual Box
* [Gentoo Handbook](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation)
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
* Set USE flags: 
```
nano -w /etc/portage/make.conf
# Add to file above
USE="-gtk -gnome -qt4 -qt5 -kde X dvd alsa"
```
* Timezone:
```
ls /usr/share/zoneinfo
echo "America/Detroit" > /etc/timezone
emerge --config sys-libs/timezone-data
```
* Locale:
```
nano -w /etc/locale.gen
# Add to file
en_US ISO-8859-1
en_US.UTF-8 UTF-8
locale-gen
eselect locale list
eselect locale set 6
```
* Reload the environment: `env-update && source /etc/profile && export PS1="(chroot) ${PS1}"`

* Kernel setup:
```
emerge --ask sys-kernel/gentoo-sources
# MANUAL Kernel Setup
ls -l /usr/src/linux
# Aid in listing devices for kernel config
emerge --ask sys-apps/pciutils
# List pci hardware
lspci
cd /usr/src/linux

# Genkernel Kernel Setup
emerge --ask sys-kernel/genkernel
nano -w /etc/fstab
# Insert: /dev/sda2               /boot           ext4            defaults        0 2
# Build the kernel
genkernel all
```

* Configure fstab:
```
nano -w /etc/fstab
# Add
/dev/sda2               /boot           ext4            defaults        0 2
/dev/sda3               none            swap            sw              0 0
/dev/sda4               /               ext4            noatime         0 1
```

* Set hostname: `nano -w /etc/conf.d/hostname`
* Configure networking:
```
emerge --ask --noreplace net-misc/netifrc
nano -w /etc/conf.d/net
# DHCP
config_enp0s3="dhcp"
cd /etc/init.d 
ln -s net.lo net.enp0s3
rc-update add net.enp0s3 default
```

* Set root password: `passwd`
* Install system logging package: 
```
emerge --ask app-admin/sysklogd`
rc-update add sysklogd default
```

* Install cron package: 
```
emerge --ask sys-process/cronie
rc-update add cronie default
```
* Enable sshd: `rc-update add sshd default`
* Install extra tools: `emerge --ask net-misc/dhcpcd sys-fs/e2fsprogs htop vim`

* Configure bootloader:
```
emerge --ask --verbose sys-boot/grub:2
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```
* Done: 
```
exit
# unmount filesystems

reboot
```








