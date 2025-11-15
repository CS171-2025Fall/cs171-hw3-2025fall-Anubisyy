#!/bin/bash
# 快速重新编译脚本

set -e  # 遇到错误立即退出

# 激活 conda 环境
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate CS171

# 进入 build 目录
cd "$(dirname "$0")/build"

# 获取 CPU 核心数
CORES=$(sysctl -n hw.ncpu 2>/dev/null || echo 4)

echo "开始编译，使用 $CORES 个核心..."
make -j$CORES

echo ""
echo "编译完成！可执行文件位置："
echo "  - renderer:    build/src/renderer"
echo "  - conventions: build/src/conventions"
echo "  - exrtools:    build/src/exrtools"
echo ""
echo "运行示例："
echo "  ./build/src/renderer data/sphere.json"

