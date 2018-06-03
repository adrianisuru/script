#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root!"
   exit 1
fi

if [ -d /sys/firmware/efi/efivars ]
then
    echo "uefi detected"
else
    echo "bios detected"
fi

if [ ping -q -w 1 -c 1 `ip r | grep default | cut -d ' ' -f 3` > /dev/null ]; then
   echo "internet detected"
else
   echo "no internet"
fi

Then...

partition disks

mkfs and mkswap

pacstrap /mnt base base-devel

genfstab -U /mnt >> /mnt/etc/fstab
ln -sf /usr/share/zoneinfo/Region/City /etc/localtime
hwclock --systohc

Uncomment en_US.UTF-8 UTF-8 and other needed localizations in /etc/locale.gen, and generate them with: 
locale-gen

echo LANG=en_US.UTF-8 > /etc/locale.conf

echo hostname > /etc/hostname

echo -e "127.0.0.1	localhost\n::1		localhost" >> /etc/hosts

pacman -S networkmanager
systemctl enable NetworkManager.service

pacman -S neovim
ln -s /bin/nvim /bin/vim

