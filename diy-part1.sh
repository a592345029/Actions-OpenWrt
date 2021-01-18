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
#sed -i 's/#src-git helloworld/src-git helloworld/g' ./feeds.conf.default

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
sed -i '$a src-git jerrykuku https://github.com/jerrykuku/openwrt-package' feeds.conf.default
sed -i '$a src-git OpenClash https://github.com/vernesong/OpenClash' feeds.conf.default
sed -i '$a src-git OpenAppFilter https://github.com/destan19/OpenAppFilter' feeds.conf.default

#====================================================================
#添加额外软件包

#git clone https://github.com/xiaorouji/openwrt-passwall.git package/passwall
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon-18.06          
#git clone https://github.com/jerrykuku/openwrt-package.git package/jerrykuku-package
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8-packages
#git clone https://github.com/destan19/OpenAppFilter.git package/OpenAppFilter
git clone https://github.com/tty228/luci-app-serverchan.git package/serverchan
#git clone -b master https://github.com/vernesong/OpenClash.git package/OpenClash
git clone https://github.com/tindy2013/openwrt-subconverter.git package/subconverter
git clone https://github.com/xiaoqingfengATGH/feeds-xiaoqingfeng.git package/xiaoqingfeng

#====================================================================
