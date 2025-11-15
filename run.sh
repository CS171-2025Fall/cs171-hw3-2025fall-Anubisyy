#!/bin/bash
# 快速运行渲染器脚本

# 激活 conda 环境
source "$(conda info --base)/etc/profile.d/conda.sh"
conda activate CS171

# 获取脚本所在目录
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# 检查可执行文件是否存在
if [ ! -f "build/src/renderer" ]; then
    echo "错误: renderer 未编译，请先运行 ./rebuild.sh"
    exit 1
fi

# 检查是否提供了场景文件
if [ $# -eq 0 ]; then
    echo "用法: $0 <场景JSON文件> [选项]"
    echo ""
    echo "示例："
    echo "  $0 data/sphere.json"
    echo "  $0 data/cbox.json -o output.exr"
    echo "  $0 data/veach.json -q"
    echo ""
    echo "可用的场景文件："
    ls -1 data/*.json 2>/dev/null | sed 's/^/  /'
    exit 1
fi

# 运行 renderer
./build/src/renderer "$@"

