#!/bin/sh

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

for soc in hi3516a hi3516d; do

sed -i "s|hi3516.v100|${soc}v100|" include/configs/hi3516a.h
make clean
make hi3516a_config

cp reg_info_${soc}.bin .reg
make -j8

make mini-boot.bin
cp mini-boot.bin output/u-boot-${soc}v100-universal.bin

done
