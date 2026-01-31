#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加mpc1903设备型号
echo -e "\\ndefine Device/sharevdi_h3399pc
  DEVICE_VENDOR := SHAREVDI
  DEVICE_MODEL := H3399PC
  SOC := rk3399
  UBOOT_DEVICE_NAME := h3399pc-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-gpio-button-hotplug kmod-r8168 kmod-usb-net-rtl8152 kmod-usb3
endef
TARGET_DEVICES += sharevdi_h3399pc" >> target/linux/rockchip/image/armv8.mk


# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/h3399pc/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/h3399pc/uboot-rockchip/patches/974-rk3399-u-boot-h3399pc-fix.patch package/boot/uboot-rockchip/patches/974-rk3399-u-boot-h3399pc-fix.patch

cp -f $GITHUB_WORKSPACE/h3399pc/kernel-rockchip/patches/974-rockchip-rk3399-h3399pc-kernel.patch target/linux/rockchip/974-rockchip-rk3399-h3399pc-kernel.patch
