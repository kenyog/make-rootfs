# Script for creating rootfs of Ubuntu22.04(Arm64) for cross-building

This script creats rootfs of Ubuntu22.04(Arm64) from its install image.

## How to use

1. clone this repository in a linux system
1. change dir here
1. execute `sudo ./make_rootfs.sh`

## Prerequisites

the script uses following commands.

* wget
* xz
* losetup
* mount/umount
* tar

## What the script do?

1. Download [Ubuntu22.04(Arm64) install image](https://cdimage.ubuntu.com/releases/22.04/release/ubuntu-22.04.4-preinstalled-server-arm64+raspi.img.xz)
1. Extract it
1. Setup loopback device for the image
1. Mount it
1. Make tar-ball

