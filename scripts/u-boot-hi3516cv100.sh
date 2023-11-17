#!/bin/bash

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

for soc in hi3516c hi3518c hi3518e; do

make clean
make ${soc}_config
make -j8

dd if=u-boot.bin of=tmp1 bs=1 count=64
dd if=reg_info_${soc}v100.reg of=tmp2 bs=4096 conv=sync
dd if=u-boot.bin of=tmp3 bs=1 skip=4160
cat tmp1 tmp2 tmp3 > u-boot-${soc}.bin
rm -f tmp1 tmp2 tmp3

cp u-boot-${soc}.bin output/u-boot-${soc}v100-universal.bin

done
