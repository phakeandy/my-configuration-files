#!/bin/bash

# 判断 Shell
current_shell="$SHELL"

# 配置文件路径
script_dir="$(dirname "$(realpath "$0")")" 
config_file="$script_dir/main.sh"

config_line="source $config_file"

# 判断并配置 Bash 或 Zsh
case "$current_shell" in
    *"/bash"*)
        echo "[*] 正在为 Bash 配置."
        shell_rc_file="$HOME/.bashrc"
        ;;
    *"/zsh"*)
        echo "[*] 正在为 Zsh 配置."
        shell_rc_file="$HOME/.zshrc"
        ;;
    *)
        echo "[!] 您正在使用的 shell 既不是 Bash 也不是 Zsh. 暂不支持."
        exit 1
        ;;
esac

# 检查配置是否已经存在，避免重复添加
if ! grep -qF "$config_line" "$shell_rc_file"; then
    echo "$config_line" | tee -a "$shell_rc_file" > /dev/null
    echo "[*] 配置已成功添加到 $shell_rc_file."
else
    echo "[*] 配置已存在于 $shell_rc_file, 无需重复添加."
fi



function init_tmux () {
    cp ../tmux.conf ~/.tmux.conf
    # 安装 tpm
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    # TODO: 安装插件的脚本
    # ...
}

# current_shell="$SHELL"
# 
# if [[ "$current_shell" == *"/bash"* ]]; then
#     echo "[*] 正在为 Bash 配置."
#     cat <<EOF >> ~/.bashrc
# # 加载配置文件 https://github.com/phakeandy/my-configuration-files
# source ~/.local/my-configuration-files/sh_conf/main.sh
# EOF
#     return
# elif [[ "$current_shell" == *"/zsh"* ]]; then
#     echo "[*] 正在为 Zsh 配置."
#     cat <<EOF >> ~/.zshrc
# # 加载配置文件 https://github.com/phakeandy/my-configuration-files
# source ~/.local/my-configuration-files/sh_conf/main.sh
# EOF
#     return
# else
#     echo "您正在使用的 shell 既不是 Bash 也不是 Zsh. 暂不支持."
#     return 
# fi
