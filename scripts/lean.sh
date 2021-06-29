#!/bin/bash

pushd package/lean
git clone --depth=1 https://github.com/fw876/helloworld
rm -rf luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone -b master https://github.com/jerrykuku/luci-app-argon-config.git
popd

mkdir package/community
pushd package/community
git clone --depth=1 -b master https://github.com/vernesong/OpenClash
popd

sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' ./feeds/luci/collections/luci/Makefile
