#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加dg3399设备型号
echo -e "\\ndefine Device/rockchip_dg3399
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := DG3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := dg3399-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-ata-ahci kmod-rtl8821ae kmod-usb-net-rtl8152
endef
TARGET_DEVICES += rockchip_dg3399" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/dg3399/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/dg3399/uboot-rockchip/patches/991-rk3399-dg3399-uboot.patch package/boot/uboot-rockchip/patches/991-rk3399-dg3399-uboot.patch

cp -f $GITHUB_WORKSPACE/dg3399/kernel-rockchip/patches/991-rockchip-rk3399-dg3399-kernel.patch target/linux/rockchip/patches-6.6/991-rockchip-rk3399-dg3399-kernel.patch
