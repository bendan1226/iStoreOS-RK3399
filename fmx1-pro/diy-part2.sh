#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


# 移植设备
# linux/rockchip/image/armv8.mk添加fmx1-pro设备型号
echo -e "\\ndefine Device/rockchip_fmx1-pro
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := FMX1 PRO
  SOC := rk3399
  UBOOT_DEVICE_NAME := fmx1-pro-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-rtl8152
endef
TARGET_DEVICES += rockchip_fmx1-pro" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/fmx1-pro/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch、dts、defconfig到对应的目录
cp -f $GITHUB_WORKSPACE/fmx1-pro/uboot-rockchip/dts/rk3399-fmx1-pro.dts package/boot/uboot-rockchip/src/dts/upstream/src/arm64/rockchip/rk3399-fmx1-pro.dts
cp -f $GITHUB_WORKSPACE/fmx1-pro/uboot-rockchip/patches/996-u-boot-fmx1-pro-fix.patch package/boot/uboot-rockchip/patches/996-u-boot-fmx1-pro-fix.patch

cp -f $GITHUB_WORKSPACE/fmx1-pro/kernel-rockchip/patches/996-rockchip-rk3399-fmx1-pro-kernel.patch target/linux/rockchip/patches-6.6/996-rockchip-rk3399-fmx1-pro-kernel.patch
