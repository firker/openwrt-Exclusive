#!/bin/bash
#============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#============================================================

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate
rm -rf ./package/ctcgfw/luci-app-adguardhome
rm -rf ./package/ctcgfw/luci-theme-argon-mod
rm -rf ./package/lean/luci-theme-argon
rm -rf ./package/ntlf9t/AdGuardHome
rm -rf ./package/ntlf9t/luci-app-smartdns
rm -rf ./package/ntlf9t/smartdns
rm -rf ./package/ntlf9t/openwrt-udp2raw
rm -rf ./package/ntlf9t/dnscrypt-proxy-full
