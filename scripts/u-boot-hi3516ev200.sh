#!/bin/sh

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

for soc in hi3516ev200 hi3516ev300 hi3518ev300; do

make clean
cp config-${soc} .config
cp reg_info_${soc}.bin .reg
make -j8

make u-boot-z.bin
cp u-boot-${soc}.bin output/u-boot-${soc}-universal.bin

done
