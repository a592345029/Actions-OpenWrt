基于Lean的Openwrt源码仓库！

默认登陆IP 192.168.0.1, 密码 password
------
编译命令如下:

首先装好 Ubuntu 64bit，推荐 Ubuntu 18 LTS x64

命令行输入
sudo apt-get update
使用 git clone https://github.com/coolsnowwolf/lede 命令下载好源代码，然后 cd lede 进入目录
然后输入命令搭建系统环境

以下的命令适用Ubuntu 18

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex node-uglify git gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx-ucl libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync

以下的命令适用Ubuntu 20

sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev patch unzip lib32gcc1 libc6-dev-i386 subversion flex gcc-multilib g++-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils libelf-dev autoconf automake libtool autopoint device-tree-compiler python2.7 zlib1g-dev upx-ucl node-uglify antlr3 gperf wget swig rsync

如果你使用root执行了以上命令，那从此时开始，你必须使用非root权限用户进行后续操作
------
二次编译：
```bash
cd lede
git pull
./scripts/feeds update -a && ./scripts/feeds install -a
make defconfig
make -j8 download
make -j$(($(nproc) + 1)) V=s
```

如果需要重新配置：
```bash
rm -rf ./tmp && rm -rf .config
make menuconfig
make -j$(($(nproc) + 1)) V=s
```

编译完成后输出路径：/lede/bin/targets

特别提示：
------
源代码中绝不含任何后门和可以监控或者劫持你的 HTTPS 的闭源软件，SSL 安全是互联网最后的壁垒。安全干净才是固件应该做到的；

Github Actions 是 GitHub 推出的持续集成服务，它提供了配置非常不错的虚拟服务器环境（E5 2vCPU/7G RAM / 84G ssd），基于它可以进行构建、测试、打包、部署项目。如觉得项目好，请花1秒钟点亮顶部⭐star,分享给更多的朋友.

- 通过修改`diy-part2.sh`文件可以自定义默认IP，登陆密码等。
- 修改流程文件触发条件。
- 在触发工作流程后，在 Actions 页面等待执行到`SSH connection to Actions`步骤，会出现下面信息：  
  ***
  `To connect to this session copy-n-paste the following into a terminal or browser:` 
  
  `ssh Y26QeagDtsPXp2mT6me5cnMRd@nyc1.tmate.io`    
  
  `https://tmate.io/t/Y26QeagDtsPXp2mT6me5cnMRd`     
  ***
- 复制 SSH 连接命令粘贴到终端内执行，或者复制链接在浏览器中打开使用网页终端，登陆云menuconfig。
- 命令：`cd openwrt && make menuconfig`
- 如果此时页面没有反应，请ctrl+c
- 新手参考OpenWrt MenuConfig设置和LuCI插件选项说明
- 完成后按快捷键`Ctrl+D`或执行`exit`命令退出，后续编译工作将自动进行。
- 这样比较灵活，可以根据路由器硬件通过云`menuconfig`自定义配置固件，不需要再导出`.config`和上传
- 进阶玩法请看P3TERX的博客[中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)
