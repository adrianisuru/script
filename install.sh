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
