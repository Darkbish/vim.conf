#!/usr/bin/env bash
# Reset
Color_off='\033[0m'       # Text Reset
# Regular Colors
Red='\033[0;31m'          # Red
Blue='\033[0;34m'         # Blue
Version='0.1.0'

echo 'Config Vim ...'


# 生成 .vim 文件夹
# [[-d ~/.vim]] || mkdir ~/.vim;

# tmp dir
# [[-d ~/VimWeb]] || mkdir ~/VimWeb;

# .vimrc
# cd ~/VimWeb;
# [[-d ~/VimWeb/rc]] || git clone https://github.com/jaywcjlove/vim-web.git;

install_vim () {
    if [[ -f "$HOME/.vimrc" ]]; then
        mv "$HOME/.vimrc" "$HOME/.vimrc.bak"
        echo -e "${Blue}BackUp $HOME/.vimrc${Color_off}"
    fi

    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.vim\.conf$ ]]; then
            echo -e "${Blue}Installed plugins for vim${Color_off}"
        else
            mv "$HOME/.vim" "$HOME/.vim.bak"
            echo -e "${Blue}BackUp $HOME/.vim${Color_off}"
            ln -s "$HOME/.vim.conf" "$HOME/.vim"
            echo -e "${Blue}Installed plugins for vim${Color_off}"
        fi
    else
        ln -s "$HOME/.vim.conf" "$HOME/.vim"
        ln -s "$HOME/.vim.conf/.vimrc" "$HOME/.vimrc"
        echo -e "${Blue}Installed plugins for vim${Color_off}"
    fi
}


uninstall_vim () {
    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.vim.conf$ ]]; then
            rm "$HOME/.vim"
            echo -e "${Blue}Uninstall plugins for vim${Color_off}"
            if [[ -d "$HOME/.vim.bak" ]]; then
                mv "$HOME/.vim.bak" "$HOME/.vim"
                echo -e "${Blue}Recover $HOME/.vim${Color_off}"
            fi
        fi
    fi
    if [[ -f "$HOME/.vimrc.bak" ]]; then
        mv "$HOME/.vimrc.bak" "$HOME/.vimrc"
        echo -e "${Blue}Recover $HOME/.vimrc${Color_off}"
    fi
}

usage () {
    echo " "
    echo " vim conf install script : ${Version}v0.1.0"
    echo " "
    echo -e "  ${Blue}Install plugins for vim${Color_off}"
    echo "  curl -sLf https://raw.githubusercontent.com/Darkbish/vim.conf/master/install.sh | bash -s -- install"
    echo " "
    echo -e "  ${Blue}Uninstall plugins${Color_off}"
    echo "  curl -sLf https://raw.githubusercontent.com/Darkbish/vim.conf/master/install.sh | bash -s -- uninstall"
    echo " "
}

need_cmd () {
  if ! hash "$1" &>/dev/null; then
    echo -e "${Red}need '$1' (command not found)${Color_off}"
    exit 1
    fi
}


fetch_repo () {
    if [[ -d "$HOME/.vim.conf" ]]; then
        git --git-dir "$HOME/.vim.conf/.git" pull
        echo -e "${Blue}Successfully update .vim.conf${Color_off}"
    else
        git clone https://github.com/Darkbish/vim.conf.git "$HOME/.vim.conf"
        echo -e "${Blue}Successfully clone .vim.conf${Color_off}"
    fi
}

if [ $# -gt 0 ]
then
    case $1 in
        uninstall)
            uninstall_vim
            exit 0
            ;; 
        install)
            need_cmd 'git'
            fetch_repo
            install_vim
            # echo -e "${Red}need'$1'(command 5 install_vim)${Color_off}"
            exit 0
            ;;
        -h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 0
    esac
fi

