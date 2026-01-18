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
echo -e "\\ndefine Device/rocktech_mpc1903
  DEVICE_VENDOR := Rocktech
  DEVICE_MODEL := MPC1903
  SOC := rk3399
  UBOOT_DEVICE_NAME := mpc1903-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-usb-net-smsc75xx kmod-usb-serial-cp210x kmod-ata-ahci kmod-usb-net-rtl8152 wpad-openssl
endef
TARGET_DEVICES += rocktech_mpc1903" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/mpc1903/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/mpc1903/uboot-rockchip/patches/979-rk3399-mpc1903-uboot.patch package/boot/uboot-rockchip/patches/979-rk3399-mpc1903-uboot.patch

cp -f $GITHUB_WORKSPACE/mpc1903/kernel-rockchip/patches/979-rockchip-rk3399-mpc1903-kernel.patch target/linux/rockchip/patches-6.6/979-rockchip-rk3399-mpc1903-kernel.patch
