#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================

sed -i 's/KERNEL_PATCHVER:=6.6/KERNEL_PATCHVER:=6.12/g' ./target/linux/x86/Makefile
sed -i '/openwrt-24.10/d' feeds.conf.default
sed -i 's/^#\(.*luci\)/\1/' feeds.conf.default

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

function merge_package(){
    repo=`echo $1 | rev | cut -d'/' -f 1 | rev`
    pkg=`echo $2 | rev | cut -d'/' -f 1 | rev`
    # find package/ -follow -name $pkg -not -path "package/custom/*" | xargs -rt rm -rf
    git clone --depth=1 --single-branch $1
    mv $2 package/custom/
    rm -rf $repo
}
function drop_package(){
    find package/ -follow -name $1 -not -path "package/custom/*" | xargs -rt rm -rf
}

rm -rf package/custom; mkdir package/custom

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
# sed -i '$a src-git bypass https://github.com/garypang13/openwrt-bypass' feeds.conf.default
# mv -vf ../mt7621_phicomm_k2p.dts ./target/linux/ramips/dts/mt7621_phicomm_k2p.dts
#　git clone https://github.com/vernesong/OpenClash.git package/OpenClash
# git clone https://github.com/jerrykuku/luci-app-vssr.git  package/luci-app-vssr
# merge_package https://github.com/messense/aliyundrive-webdav aliyundrive-webdav/openwrt applications/aliyundrive-webdav
merge_package https://github.com/vernesong/OpenClash OpenClash/luci-app-openclash
# merge_package https://github.com/sirpdboy/sirpdboy-package sirpdboy-package/luci-app-smartdns
# merge_package https://github.com/sirpdboy/sirpdboy-package sirpdboy-package/smartdns
# git clone https://github.com/QiuSimons/openwrt-mos.git package/openwrt-mos
git clone https://github.com/thinktip/luci-theme-neobird.git package/luci-theme-neobird
# git clone https://github.com/sbwml/openwrt-alist.git package/openwrt-alist
# svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass package/luci-app-bypass
git clone https://github.com/fw876/helloworld.git package/ssr
git clone https://github.com/firker/diy-ziyong.git package/diy-ziyong
git clone https://github.com/xiaorouji/openwrt-passwall-packages.git package/openwrt-passwall
git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
# git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns
# git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
# git clone https://github.com/immortalwrt/homeproxy.git package/luci-app-homeproxy
# git clone -b luci-smartdns-new-version https://github.com/xiaorouji/openwrt-passwall package/luci-app-passwall
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git  package/luci-theme-argon-18.06
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
git clone https://github.com/sirpdboy/luci-theme-opentopd.git package/luci-theme-opentopd
git clone https://github.com/zzsj0928/luci-app-pushbot package/luci-app-pushbot
# git clone https://github.com/xiaorouji/openwrt-passwall2.git package/passwall2
# git clone https://github.com/firkerword/luci-app-lucky.git package/lucky
find ./ | grep Makefile | grep v2ray-geodata | xargs rm -f
find ./ | grep Makefile | grep mosdns | xargs rm -f
git clone https://github.com/sbwml/luci-app-mosdns -b v5-lua package/mosdns
git clone https://github.com/gdy666/luci-app-lucky.git package/lucky
# git clone https://github.com/project-lede/luci-app-godproxy.git package/luci-app-godproxy
# git clone https://github.com/garypang13/luci-app-dnsfilter.git package/luci-app-dnsfilter
# git clone https://github.com/BCYDTZ/luci-app-UUGameAcc.git package/luci-app-UUGameAcc
# git clone https://github.com/yichya/luci-app-xray.git package/luci-app-xray


