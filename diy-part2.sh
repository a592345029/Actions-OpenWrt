#!/bin/bash
#====================================================================
# Copyright (c) 2019-2020 iplcdn <https://iplcdn.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/iplcdn/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#====================================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.0.1/g' package/base-files/files/bin/config_generate

# Modify hostname
#sed -i 's/OpenWrt/OpenWrt/g' package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /complied by iplcdn $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

rm -rf package/feeds/routing/olsrd/patches/012-gpsd.patch
rm -rf package/lean/default-settings/files/zzz-default-settings
wget https://raw.githubusercontent.com/coolsnowwolf/lede/99222f49fd9f63eef575ac34f251280e6e97f3b3/package/lean/default-settings/files/zzz-default-settings -O package/lean/default-settings/files/zzz-default-settings
sed -i 's/DEPENDS.*/& \+luci-i18n-samba-zh-cn/g'         package/lean/autosamba/Makefile
sed -i '92d'                                             package/system/opkg/Makefile
sed -i '/shadow/d'                                       package/lean/default-settings/files/zzz-default-settings
sed -i '/nas/d'                                          package/lean/default-settings/files/zzz-default-settings
sed -i "s/openwrt.proxy.ustclug.org/openwrt.download/g"  package/lean/default-settings/files/zzz-default-settings
sed -i "s/https:/R20.0.0/g"                              package/lean/default-settings/files/zzz-default-settings
sed -i  's/http:/snapshots/g'                            package/lean/default-settings/files/zzz-default-settings
sed -i  " 23i sed -i 's/http:/https:/g' /etc/opkg/distfeeds.conf"  package/lean/default-settings/files/zzz-default-settings
sed -i  "s/R20\(.[0-9].[0-9]\{1,2\}\)/R21.$version/g"    package/lean/default-settings/files/zzz-default-settings

sed -i "44i echo 'src/gz openwrt_all https://openwrt.download/ExtraPackages/all' > /etc/opkg/customfeeds.conf " package/lean/default-settings/files/zzz-default-settings
sed -i "45i echo 'src/gz openwrt_ipk https://openwrt.download/ExtraPackages/x86_64' >> /etc/opkg/customfeeds.conf " package/lean/default-settings/files/zzz-default-settings

# Delete default password
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings

#rm -rf feeds/packages/net/smartdns
rm -rf package/lean/luci-theme-argon

#svn co https://github.com/Lienol/openwrt/trunk/package/diy/luci-app-adguardhome                           package/adg
#git clone https://github.com/pymumu/luci-app-smartdns.git -b lede                                         package/luci-app-smartdns
#svn co https://github.com/Lienol/openwrt-packages/trunk/net/smartdns    


sed -i 's/luci-theme-bootstrap/luci-theme-argon-18.06/g' feeds/luci/collections/luci/Makefile

# Add kernel build user
[ -z $(grep "CONFIG_KERNEL_BUILD_USER=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_USER="OpenWrt"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_USER=\).*@\1$"OpenWrt"@' .config

# Add kernel build domain
[ -z $(grep "CONFIG_KERNEL_BUILD_DOMAIN=" .config) ] &&
    echo 'CONFIG_KERNEL_BUILD_DOMAIN="GitHub Actions"' >>.config ||
    sed -i 's@\(CONFIG_KERNEL_BUILD_DOMAIN=\).*@\1$"GitHub Actions"@' .config
