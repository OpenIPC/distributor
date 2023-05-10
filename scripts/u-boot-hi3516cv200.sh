#!/bin/bash

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

for soc in hi3516cv200 hi3518ev200; do

make clean
make ${soc}_config

cp reg_info_${soc}.bin .reg
make -j8

make mini-boot.bin
cp mini-boot.bin output/u-boot-${soc}-universal.bin

done
