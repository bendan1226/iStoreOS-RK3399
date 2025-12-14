#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加zysj-1739a设备型号
echo -e "\\ndefine Device/rockchip_zysj
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := ZYSJ
  SOC := rk3399
  UBOOT_DEVICE_NAME := zysj-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := brcmfmac-nvram-43455-sdio cypress-firmware-43455-sdio swconfig wpad \
	kmod-brcmfmac kmod-ata-ahci kmod-usb-net-rtl8152 kmod-gpio-button-hotplug
endef
TARGET_DEVICES += rockchip_zysj" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/zysj-1739a/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/zysj-1739a/uboot-rockchip/patches/987-rk3399-zysj-uboot.patch package/boot/uboot-rockchip/patches/987-rk3399-zysj-uboot.patch

cp -f $GITHUB_WORKSPACE/zysj-1739a/kernel-rockchip/patches/987-rockchip-rk3399-zysj-kernel.patch target/linux/rockchip/patches-6.6/987-rockchip-rk3399-zysj-kernel.patch
