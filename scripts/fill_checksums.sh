#!/bin/bash

cd "$(dirname "$0")/.."

# 计算校验值
pkg_md5=$(md5 -q Packages)
gz_md5=$(md5 -q Packages.gz)
pkg_sha=$(shasum -a 256 Packages | cut -d' ' -f1)
gz_sha=$(shasum -a 256 Packages.gz | cut -d' ' -f1)
pkg_size=$(stat -f%z Packages)
gz_size=$(stat -f%z Packages.gz)

# 追加到Release文件
cat >> Release <<END
MD5Sum:
 $pkg_md5 $pkg_size Packages
 $gz_md5 $gz_size Packages.gz
SHA256:
 $pkg_sha $pkg_size Packages
 $gz_sha $gz_size Packages.gz
END

echo "校验信息已更新"
