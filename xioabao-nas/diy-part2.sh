#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加xiaobao-nas设备型号
echo -e "\\ndefine Device/codinge_xiaobao-nas
  DEVICE_VENDOR := Codinge
  DEVICE_MODEL := XiaoBao NAS
  SOC := rk3399
  UBOOT_DEVICE_NAME := xiaobao-nas-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-ata-ahci kmod-usb-net-rtl8152
endef
TARGET_DEVICES += codinge_xiaobao-nas" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/xioabao-nas/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/xiaobao-nas/uboot-rockchip/patches/994-rk3399-xiaobao-nas-uboot.patch package/boot/uboot-rockchip/patches/994-rk3399-xiaobao-nas-uboot.patch

cp -f $GITHUB_WORKSPACE/xiaobao-nas/kernel-rockchip/patches/994-rockchip-rk3399-xiaobao-nas-kernel.patch target/linux/rockchip/patches-6.6/994-rockchip-rk3399-xiaobao-nas-kernel.patch
