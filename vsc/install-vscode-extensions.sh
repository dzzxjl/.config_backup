#!/usr/bin/env bash

# 从 extensions.txt 批量安装 VS Code 扩展。
# 仅安装“Cursor 与 VS Code 通用扩展”和“VS Code 对应扩展”，
# 自动跳过“Cursor 专属扩展”。

set -euo pipefail

script_dir="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
extensions_file="${script_dir}/extensions.txt"

if command -v code >/dev/null 2>&1; then
    vscode_cli="$(command -v code)"
elif [[ -x "/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code" ]]; then
    vscode_cli="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
else
    echo "错误：未找到 VS Code 命令行工具。" >&2
    echo "请确认已安装 Visual Studio Code，或在命令面板执行：" >&2
    echo "Shell Command: Install 'code' command in PATH" >&2
    exit 1
fi

if [[ ! -f "${extensions_file}" ]]; then
    echo "错误：找不到扩展清单 ${extensions_file}" >&2
    exit 1
fi

extension_ids="$({
    awk '
        /^# Cursor 与 VS Code 通用扩展$/ { install = 1; next }
        /^# Cursor 专属扩展$/           { install = 0; next }
        /^# VS Code 对应扩展$/          { install = 1; next }
        install && /^[[:alnum:]][[:alnum:].-]+$/ { print }
    ' "${extensions_file}"
})"

if [[ -z "${extension_ids}" ]]; then
    echo "错误：扩展清单中没有找到可供 VS Code 安装的扩展。" >&2
    exit 1
fi

echo "使用 VS Code CLI：${vscode_cli}"
echo "读取扩展清单：${extensions_file}"

installed_count=0
failed_extensions=()

while IFS= read -r extension_id; do
    [[ -z "${extension_id}" ]] && continue

    echo
    echo "正在安装：${extension_id}"

    if "${vscode_cli}" --install-extension "${extension_id}"; then
        installed_count=$((installed_count + 1))
    else
        failed_extensions+=("${extension_id}")
    fi
done <<< "${extension_ids}"

echo
echo "处理完成：${installed_count} 个扩展安装或更新成功。"

if (( ${#failed_extensions[@]} > 0 )); then
    echo "以下扩展安装失败：" >&2
    printf '  - %s\n' "${failed_extensions[@]}" >&2
    exit 1
fi

echo "请在 VS Code 中执行 Developer: Reload Window 以重新加载扩展。"
