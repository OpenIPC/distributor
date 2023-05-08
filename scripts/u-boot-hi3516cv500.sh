#!/bin/sh

export CROSS_COMPILE=arm-linux-gnueabi-
mkdir -p output

for soc in hi3516av300 hi3516cv500 hi3516dv300; do

make clean
make ${soc}_smp_defconfig
cp reginfo-${soc}.bin .reg
make -j8

make SHELL=/bin/bash -C tools/hi_gzip
cp -f tools/hi_gzip/bin/gzip arch/arm/cpu/armv7/${soc}/hw_compressed

make u-boot-z.bin
cp u-boot-${soc}.bin output/u-boot-${soc}-universal.bin

done
