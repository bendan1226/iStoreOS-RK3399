#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加am40设备型号
echo -e "\\ndefine Device/smart_am40
  DEVICE_VENDOR := SMART
  DEVICE_MODEL := AM40
  SOC := rk3399
  UBOOT_DEVICE_NAME := am40-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := wpad-mbedtls kmod-rtw88-8822be kmod-bluetooth kmod-usb-dwc3 \
  kmod-sound-soc-simple-card kmod-sound-soc-rockchip kmod-sound-soc-hdmi-codec kmod-ata-ahci kmod-usb-net-rtl8152 \
  kmod-drm-rockchip kmod-drm-panfrost kmod-extcon-usbc-virtual-pd rockchip-cdn-dp-firmware
endef
TARGET_DEVICES += smart_am40" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/am40/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/am40/uboot-rockchip/patches/990-rk3399-am40-uboot.patch package/boot/uboot-rockchip/patches/990-rk3399-am40-uboot.patch

cp -f $GITHUB_WORKSPACE/am40/kernel-rockchip/patches/990-rockchip-rk3399-am40-kernel.patch target/linux/rockchip/patches-6.6/990-rockchip-rk3399-am40-kernel.patch
