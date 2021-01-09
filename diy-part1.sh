#!/bin/bash
#====================================================================
# Copyright (c) 2019-2020 iplcdn <https://iplcdn.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/iplcdn/Actions-OpenWrt
# Description: Build OpenWrt using GitHub Actions
#====================================================================

# fw876/helloworld
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

#sed -i 's@coolsnowwolf/packages@P3TERX/packages@' feeds.conf.default

sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default
