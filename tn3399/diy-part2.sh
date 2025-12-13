#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加tn3399设备型号
echo -e "\\ndefine Device/rockchip_tn3399
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := TN3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := tn3399-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := brcmfmac-nvram-43455-sdio cypress-firmware-43455-sdio swconfig wpad \
	kmod-brcmfmac kmod-ata-ahci kmod-usb-net-rtl8152 kmod-gpio-button-hotplug
endef
TARGET_DEVICES += rockchip_tn3399" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/tn3399/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/tn3399/uboot-rockchip/patches/988-rk3399-tn3399-u-boot.patch package/boot/uboot-rockchip/patches/988-rk3399-tn3399-u-boot.patch

cp -f $GITHUB_WORKSPACE/tn3399/kernel-rockchip/patches/988-rockchip-rk3399-tn3399-kernel.patch target/linux/rockchip/patches-6.6/988-rockchip-rk3399-tn3399-kernel.patch
