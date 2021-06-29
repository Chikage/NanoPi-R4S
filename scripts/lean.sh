#!/bin/bash

pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone -b master https://github.com/jerrykuku/luci-app-argon-config.git
rm -rf luci-app-docker
git clone --depth=1 https://github.com/lisaac/luci-app-dockerman
git clone --depth=1 https://github.com/lisaac/luci-lib-docker
popd

mkdir package/community
pushd package/community
git clone --depth=1 -b master https://github.com/vernesong/OpenClash
popd

git am $GITHUB_WORKSPACE/patches/*.patch
echo -e " OpenWrt Built on "$(date +%Y.%m.%d)"\n -----------------------------------------------------" >> package/base-files/files/etc/banner

pushd package/lean/autocore/files/arm/sbin
cp -f $GITHUB_WORKSPACE/scripts/cpuinfo cpuinfo
popd

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
