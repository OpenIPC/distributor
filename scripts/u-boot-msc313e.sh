#!/bin/bash

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

make infinity3_defconfig
make -j8

./make_boot.sh
cp BOOT.bin output/u-boot-msc313x-universal.bin
cp BOOT.bin output/u-boot-msc316x-universal.bin
