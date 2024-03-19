#!/bin/bash
set -e

URL=https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.4-preinstalled-server-arm64+raspi.img.xz
IMAGE_FILE=$(basename $URL)
MP=mntp2

if [ ${EUID:-${UID}} -ne 0 ]; then
	echo "Requires root privileges. use 'sudo'"
	exit 1
fi

if [ ! -f "$IMAGE_FILE" ]; then
	echo "Download $IMAGE_FILE from $URL"
	wget $URL
fi

if [[ "$IMAGE_FILE" = *.xz ]]; then
	echo "Extracting image file"
	xz -d -k $IMAGE_FILE
	IMAGE_FILE=`basename $IMAGE_FILE .xz`
fi

echo "Set loop-back device for image"
losetup -fP $IMAGE_FILE
DEVICE=$(losetup -l | grep $IMAGE_FILE | cut -d' ' -f 1)
trap "losetup -d $DEVICE" EXIT

echo "Mount loop-back device onto $MP"
mkdir -p $MP
mount ${DEVICE}p2 $MP
trap "umount $MP ; losetup -d $DEVICE" EXIT

echo "Archive rootfs"
tar -C $MP --exclude-from=tar_excludes.txt -czp . -f rootfs.tar.gz

