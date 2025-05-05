#!/bin/bash
# 计算 Packages/Packages.gz 的校验和并写入 Release
echo "Updating Release checksums..."

cd "$(dirname "$0")/.."

# 清空现有的校验和（macOS兼容写法）
sed -i '' '/^MD5Sum:/,$d' Release

# 重新计算 MD5 和 SHA256
echo "MD5Sum:" >> Release
md5 Packages Packages.gz | awk '{print $4" "$2}' >> Release
echo "SHA256:" >> Release
shasum -a 256 Packages Packages.gz | awk '{print $1" "$2}' >> Release

echo "Done!"