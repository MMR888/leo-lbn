#!/bin/zsh

{
cat <<'END'
Origin: Leo's Repo
Label: Leo's Repo
Suite: stable
Version: 1.0
Codename: ios
Architectures: iphoneos-arm iphoneos-arm64
Components: main
Description: Test repository
END

echo "MD5Sum:"
md5 Packages Packages.gz | awk '{printf " %s %8d %s\n", $1, $2, $3}'

echo "SHA256:"
shasum -a 256 Packages Packages.gz | awk '{printf " %s %8d %s\n", $1, $2, $3}'
} > Release
