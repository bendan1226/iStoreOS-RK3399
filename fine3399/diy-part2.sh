#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加fine3399设备型号
echo -e "\\ndefine Device/rumu3f_fine3399
  DEVICE_VENDOR := RUMU3F
  DEVICE_MODEL := FINE3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := fine3399-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := brcmfmac-firmware-43430b0-sdio brcmfmac-nvram-43430b0-sdio \
	kmod-brcmfmac kmod-gpio-button-hotplug kmod-usb-net-rtl8152 wpad
endef
TARGET_DEVICES += rumu3f_fine3399" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/fine3399/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/fine3399/uboot-rockchip/patches/987-rk3399-fine3399-uboot.patch package/boot/uboot-rockchip/patches/987-rk3399-fine3399-uboot.patch

cp -f $GITHUB_WORKSPACE/fine3399/kernel-rockchip/patches/987-rockchip-rk3399-fine3399-kernel.patch target/linux/rockchip/patches-6.6/987-rockchip-rk3399-fine3399-kernel.patch

cp -f $GITHUB_WORKSPACE/fine3399/kernel-rockchip/02_network target/linux/rockchip/armv8/base-files/etc/board.d/02_network
