#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=5.15/KERNEL_PATCHVER:=5.10/g' ./target/linux/x86/Makefile

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git ssr https://github.com/fw876/helloworld' feeds.conf.default
sed -i '$a src-git diy https://github.com/firker/diy-ziyong' feeds.conf.default
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
svn co https://github.com/messense/aliyundrive-webdav/trunk/openwrt package/aliyundrive-webdav
svn co https://github.com/vernesong/OpenClash/trunk/luci-app-openclash package/luci-app-openclash
svn co https://github.com/kiddin9/openwrt-packages/trunk/adguardhome package/adguardhome
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray
