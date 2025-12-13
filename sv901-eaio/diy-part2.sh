#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加sv901-eaio设备型号
echo -e "\\ndefine Device/scensmart_sv901-eaio
  DEVICE_VENDOR := ScenSmart
  DEVICE_MODEL := SV901 EAIO
  SOC := rk3399
  UBOOT_DEVICE_NAME := sv901-eaio-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := brcmfmac-nvram-4329-sdio brcmfmac-nvram-4356-sdio cypress-firmware-4356-sdio \
	kmod-brcmfmac kmod-ata-ahci kmod-usb-net-rtl8152 kmod-gpio-button-hotplug \
	kmod-switch-rtl8367b swconfig wpad
endef
TARGET_DEVICES += scensmart_sv901-eaio" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/sv901-eaio/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/sv901-eaio/uboot-rockchip/patches/989-rk3399-sv901-eaio-uboot.patch package/boot/uboot-rockchip/patches/989-rk3399-sv901-eaio-uboot.patch

cp -f $GITHUB_WORKSPACE/sv901-eaio/kernel-rockchip/patches/989-rockchip-rk3399-sv901-eaio-kernel.patch target/linux/rockchip/patches-6.6/989-rockchip-rk3399-sv901-eaio-kernel.patch
