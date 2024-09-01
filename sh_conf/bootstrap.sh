#!/bin/bash
# 判断 Shell
current_shell="$SHELL"

if [[ "$current_shell" == *"/bash"* ]]; then
    echo "[*] 正在为 Bash 配置."
    cat <<EOF >> ~/.bashrc
# 加载配置文件 https://github.com/phakeandy/my-configuration-files
source ~/.local/my-configuration-files/sh_conf/main.sh
EOF
    return
elif [[ "$current_shell" == *"/zsh"* ]]; then
    echo "[*] 正在为 Zsh 配置."
    cat <<EOF >> ~/.zshrc
# 加载配置文件 https://github.com/phakeandy/my-configuration-files
source ~/.local/my-configuration-files/sh_conf/main.sh
EOF
    return
else
    echo "您正在使用的 shell 既不是 Bash 也不是 Zsh. 暂不支持."
    return 
fi

function init_tmux () {
    cp ../tmux.conf ~/.tmux.conf
    # 安装 tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # TODO: 安装插件的脚本
    # ...
}