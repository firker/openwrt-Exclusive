#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================
sed -i '/DTS_DIR:=$(LINUX_DIR)/a\BUILD_DATE_PREFIX := $(shell date +'%F')' ./include/image.mk
sed -i 's/IMG_PREFIX:=/IMG_PREFIX:=$(BUILD_DATE_PREFIX)-/g' ./include/image.mk
sed -i "s/DISTRIB_DESCRIPTION='OpenWrt '/DISTRIB_DESCRIPTION='OpenWrt-Firker '/g" ./package/lean/default-settings/files/zzz-default-settings
sed -i "s/hostname='OpenWrt'/hostname='OpenWrt-SE'/g" ./package/base-files/files/bin/config_generate

# curl -fsSL  https://raw.githubusercontent.com/firkerword/KPR/main/logo.jpg > ./package/luci-app-serverchan/root/usr/bin/serverchan/api/logo.jpg
# wget https://raw.githubusercontent.com/firkerword/KPR/main/cus_config.yaml -O ./package/openwrt-mos/luci-app-mosdns/root/etc/mosdns/config.yaml
# Modify default IP
# sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
# rm -rf ./feeds/luci/applications/luci-app-qbittorrent
rm -rf ./feeds/luci/applications/luci-app-wechatpush
rm -rf ./feeds/luci/applications/luci-app-mosdns
rm -rf ./feeds/packages/net/mosdns
