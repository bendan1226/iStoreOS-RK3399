#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加king3399设备型号
echo -e "\\ndefine Device/rongpin_king3399
  DEVICE_VENDOR := Rongpin
  DEVICE_MODEL := KING3399
  SOC := rk3399
  UBOOT_DEVICE_NAME := king3399-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-ata-ahci kmod-usb-net-rtl8152 kmod-brcmfmac cypress-firmware-4356-sdio wpad-openssl
endef
TARGET_DEVICES += rongpin_king3399" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/king3399/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/king3399/uboot-rockchip/patches/980-rk3399-king3399-uboot.patch package/boot/uboot-rockchip/patches/980-rk3399-king3399-uboot.patch

cp -f $GITHUB_WORKSPACE/king3399/kernel-rockchip/patches/980-rockchip-rk3399-king3399-kernel.patch.patch target/linux/rockchip/patches-6.6/980-rockchip-rk3399-king3399-kernel.patch.patch
