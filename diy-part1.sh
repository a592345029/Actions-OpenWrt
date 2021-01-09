#!/bin/bash
#====================================================================
# Copyright (c) 2019-2020 iplcdn <https://iplcdn.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/iplcdn/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#====================================================================

# fw876/helloworld (Uncomment a feed source)
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#sed -i 's@coolsnowwolf/packages@P3TERX/packages@' feeds.conf.default

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default

rm -rf luci-theme-argon package/lean
#git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
sed -i '$a src-git luci-theme-argon https://github.com/jerrykuku/luci-theme-argon' feeds.conf.default
sed -i '$a src-git xiaoqingfeng https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng' feeds.conf.default
sed -i '$a src-git kenzok8 https://github.com/kenzok8/openwrt-packages' feeds.conf.default
sed -i '$a src-git OpenAppFilter https://github.com/destan19/OpenAppFilter' feeds.conf.default
sed -i '$a src-git luci-app-jd-dailybonus https://github.com/jerrykuku/luci-app-jd-dailybonus' feeds.conf.default
sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default
