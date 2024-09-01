#!/bin/bash
# 判断 Shell
current_shell="$SHELL"

if [[ "$current_shell" == *"/bash"* ]]; then
    echo "您正在使用 Bash. 暂不支持."
    exit
elif [[ "$current_shell" == *"/zsh"* ]]; then
    echo "[*] 正在为 Zsh配置."
    cat <<EOF >> ~/.zshrc
source ~/.local/my-configuration-files/sh_conf/main.sh
EOF
    exit
else
    echo "您正在使用的 shell 既不是 Bash 也不是 Zsh. 暂不支持."
    exit 
fi

