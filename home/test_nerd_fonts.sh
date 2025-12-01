#!/bin/bash

# 定义 Nerd Font 主要符号的 Unicode 范围（可根据需要扩展）
ranges=(
  "E0A0-E0A2"  # Powerline 箭头
  "E0B0-E0B3"  # Powerline 分隔符
  "E600-E6C5"  # Devicons
  "F000-F0FF"  # Font Awesome (部分常用)
  "F300-F3FF"  # Material Design
  "E300-E3E3"  # Weather
)

# 遍历每个范围并打印符号
for range in "${ranges[@]}"; do
  start=$(echo "$range" | cut -d'-' -f1)
  end=$(echo "$range" | cut -d'-' -f2)
  echo -e "\n=== 范围: U+$start 到 U+$end ==="
  
  # 转换十六进制到十进制，循环打印
  start_dec=$((16#$start))
  end_dec=$((16#$end))
  for ((i=start_dec; i<=end_dec; i++)); do
    # 转换十进制到十六进制，并用 printf 打印 Unicode 字符
    printf "\\U$(printf '%08x' $i) "
    # 每 16 个字符换行，便于查看
    if (( (i - start_dec + 1) % 16 == 0 )); then
      echo
    fi
  done
  echo
done
