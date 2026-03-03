#!/bin/bash

# 啟用調試模式
set -e

cd "$(dirname "$0")"

script_name=$(basename "$0")
geodata_name=${1:-geodata}

echo "開始獲取最新的 $geodata_name.zip 文件..."

LATEST_RELEASE_API="https://api.github.com/repos/ZingLix/immich-geodata-cn/releases/latest"

# 獲取下載連結 (兼容群暉 grep)
response=$(curl -fsSL $LATEST_RELEASE_API)
zip_url=$(echo "$response" | grep "browser_download_url" | grep "$geodata_name.zip" | head -n 1 | cut -d '"' -f 4)

if [ -z "$zip_url" ]; then
  echo "錯誤：未找到下載連結。"
  exit 1
fi

echo "下載地址：$zip_url"

# 下載文件
curl -L -o geodata.zip "$zip_url"

# --- 修改處：使用 7z 解壓 ---
echo "開始使用 7z 解壓 geodata.zip..."
# x: 帶完整路徑解壓, -o: 指定輸出目錄（注意 -o 後面不要有空格）, -y: 自動確認覆蓋
7z x geodata.zip -otemp_geodata -y

echo "解壓完成，正在整理文件..."

# 移出文件並清理
if [ -d "temp_geodata/geodata" ]; then
    cp -af temp_geodata/geodata/. ./
else
    cp -af temp_geodata/. ./
fi

rm -rf geodata.zip temp_geodata

echo "操作完成！請重啟 Immich 容器。"
