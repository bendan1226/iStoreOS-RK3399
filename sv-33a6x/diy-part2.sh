#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加sv-33a6x设备型号
echo -e "\\ndefine Device/seavo_sv-33a6x
  DEVICE_VENDOR := SEAVO
  DEVICE_MODEL := SV 33A6X
  SOC := rk3399
  UBOOT_DEVICE_NAME := sv-33a6x-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-smsc75xx kmod-usb-serial-cp210x kmod-ata-ahci kmod-usb-net-rtl8152 wpad-openssl
endef
TARGET_DEVICES += seavo_sv-33a6x" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/sv-33a6x/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/sv-33a6x/uboot-rockchip/patches/975-rk3399-u-boot-sv-33a6x-fix.patch package/boot/uboot-rockchip/patches/975-rk3399-u-boot-sv-33a6x-fix.patch

cp -f $GITHUB_WORKSPACE/sv-33a6x/kernel-rockchip/patches/975-rockchip-rk3399-sv-33a6x-kernel.patch target/linux/rockchip/patches-6.6/975-rockchip-rk3399-sv-33a6x-kernel.patch
