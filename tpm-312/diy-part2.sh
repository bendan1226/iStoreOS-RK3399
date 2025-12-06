#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


#移植设备
# linux/rockchip/image/armv8.mk添加tpm312设备型号
echo -e "\\ndefine Device/rockchip_tpm312
  DEVICE_VENDOR := Rockchip
  DEVICE_MODEL := TPM312
  SOC := rk3399
  UBOOT_DEVICE_NAME := tpm312-rk3399
  IMAGE/sysupgrade.img.gz := boot-common | boot-script | pine64-img | gzip | append-metadata
  DEVICE_PACKAGES := kmod-rtl8821ae kmod-usb-net-rtl8152
endef
TARGET_DEVICES += rockchip_tpm312" >> target/linux/rockchip/image/armv8.mk

# 复制修改好的uboot/Makefile到对应目录
cp -f $GITHUB_WORKSPACE/tpm-312/uboot-rockchip/Makefile package/boot/uboot-rockchip/Makefile

# 复制patch到对应的目录
cp -f $GITHUB_WORKSPACE/tpm-312/uboot-rockchip/patches/995-rk3399-tpm312-uboot.patch package/boot/uboot-rockchip/patches/995-rk3399-tpm312-uboot.patch

cp -f $GITHUB_WORKSPACE/tpm-312/kernel-rockchip/patches/995-rockchip-rk3399-tpm312-kernel.patch target/linux/rockchip/patches-6.6/995-rockchip-rk3399-tpm312-kernel.patch
