# ============================
# My alias
# ============================

alias cdhtb='cd ~/Music/htb'

# ==================================
# Man pages colorful
# ==================================

#for user custom settings
export MANROFFOPT=-c

#man colored pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# ==================================

if [[ "$SHELL" == *"/zsh"* ]]; then
    # [ -f "$HOME/.local/config/shell/zshrc.zsh" ] && . "$HOME/.local/config/shell/zshrc.zsh"
    return
fi 

# [ -f "$HOME/.local/config/shell/theme/fishlike_prompt.sh" ] && . "$HOME/.local/config/shell/theme/fishlike_prompt.sh"


function ccat() {
    local style="monokai"
    if [ $# -eq 0 ]; then
        pygmentize -P style=$style -P tabsize=4 -f terminal256 -g
    else
        for NAME in $@; do
            pygmentize -P style=$style -P tabsize=4 -f terminal256 -g "$NAME"
        done
    fi
}
