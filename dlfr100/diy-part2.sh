#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加dlfr100设备型号
echo -e "\\ndefine Device/dilusense_dlfr100
  DEVICE_VENDOR := Dilusense
  DEVICE_MODEL := DLFR100
  SOC := rk3399
  UBOOT_DEVICE_NAME := dlfr100-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-r8168 -urngd
endef
TARGET_DEVICES += dilusense_dlfr100" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/dlfr100/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/dlfr100/uboot-rockchip/patches/994-rk3399-dlfr100-uboot.patch package/boot/uboot-rockchip/patches/994-rk3399-dlfr100-uboot.patch

cp -f $GITHUB_WORKSPACE/dlfr100/kernel-rockchip/patches/994-rockchip-rk3399-dlfr100-kernel.patch target/linux/rockchip/patches-6.6/994-rockchip-rk3399-dlfr100-kernel.patch
