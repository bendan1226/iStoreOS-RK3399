#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加tvi3315a设备型号
echo -e "\\ndefine Device/rockchip_tvi3315a
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := TVI3315A
  SOC := rk3399
  UBOOT_DEVICE_NAME := tvi3315a-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-ata-ahci kmod-rtl8821ae kmod-usb-net-rtl8152 wpad \
    brcmfmac-nvram-43455-sdio cypress-firmware-43455-sdio
endef
TARGET_DEVICES += rockchip_tvi3315a" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/tvi3315a/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/tvi3315a/uboot-rockchip/patches/992-rk3399-tvi3315a-uboot.patch package/boot/uboot-rockchip/patches/992-rk3399-tvi3315a-uboot.patch

cp -f $GITHUB_WORKSPACE/tvi3315a/kernel-rockchip/patches/992-rockchip-rk3399-tvi3315a-kernel.patch target/linux/rockchip/patches-6.6/992-rockchip-rk3399-tvi3315a-kernel.patch
