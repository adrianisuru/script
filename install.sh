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
