#!/bin/bash

cd "$(dirname "$0")/.."

# 计算校验值
pkg_md5=$(md5 -q Packages)
gz_md5=$(md5 -q Packages.gz)
pkg_sha=$(shasum -a 256 Packages | awk '{print $1}')
gz_sha=$(shasum -a 256 Packages.gz | awk '{print $1}')
pkg_size=$(stat -f%z Packages)
gz_size=$(stat -f%z Packages.gz)

# 清空并重建 Release
cat > Release <<END
Origin: leo-lbn
Label: leo-lbn
Suite: stable
Version: 1.0
Architectures: iphoneos-arm
Components: main
MD5Sum:
 $pkg_md5 $pkg_size Packages
 $gz_md5 $gz_size Packages.gz
SHA256:
 $pkg_sha $pkg_size Packages
 $gz_sha $gz_size Packages.gz
END

echo "✅ Release 文件已完全重建"
