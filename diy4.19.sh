#!/bin/bash
#=============================================================
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=============================================================
# git clone https://github.com/firker/neihe.git

# mv -f neihe/Makefile ./target/linux/x86/Makefile
sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.19/g' ./target/linux/x86/Makefile
sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.19/g' ./target/linux/x86/Makefile

# Uncomment a feed source
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default
# sed -i '$a src-git jerryk https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git diy https://github.com/firker/diy-ziyong' feeds.conf.default

git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge.git package/luci-theme-edge
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus
svn co https://github.com/Lienol/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
svn co https://github.com/Lienol/openwrt-package/trunk/package/brook package/brook
svn co https://github.com/Lienol/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
svn co https://github.com/Lienol/openwrt-package/trunk/package/tcping package/tcping
svn co https://github.com/Lienol/openwrt-package/trunk/package/trojan-go package/trojan-go
svn co https://github.com/Lienol/openwrt-package/trunk/package/syncthing package/syncthing
