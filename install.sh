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
	mv "$HOME/.vimrc.bundles" "$HOME/.vimrc.bundles.bak"
        echo -e "${Blue}BackUp $HOME/.vimrc${Color_off}"
    fi

    if [[ -d "$HOME/.vim" ]]; then
        if [[ "$(readlink $HOME/.vim)" =~ \.vim.conf$ ]]; then
            echo -e "${Blue}Installed plugins for vim${Color_off}"
        else
            mv "$HOME/.vim" "$HOME/.vim.bak"
            echo -e "${Blue}BackUp $HOME/.vim${Color_off}"
            ln -s "$HOME/.vim.conf" "$HOME/.vim"
            ln -s "$HOME/.vim.conf/.vimrc" "$HOME/.vimrc"
            ln -s "$HOME/.vim.conf/.vimrc.bundles" "$HOME/.vimrc.bundles"
            echo -e "${Blue}Installed plugins for vim${Color_off}"
        fi
    else
        ln -s "$HOME/.vim.conf" "$HOME/.vim"
        ln -s "$HOME/.vim.conf/.vimrc" "$HOME/.vimrc"
        ln -s "$HOME/.vim.conf/.vimrc.bundles" "$HOME/.vimrc.bundles"
        echo -e "${Blue}Installed plugins for vim${Color_off}"
    fi

    if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]]; then
	    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
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
    else
        rm -rf "$HOME/.vimrc"
    fi
    if [[ -f "$HOME/.vimrc.bundles.bak" ]]; then
        mv "$HOME/.vimrc.bundles.bak" "$HOME/.vimrc.bundles"
        echo -e "${Blue}Recover $HOME/.vimrc.bundles${Color_off}"
    else
        rm -rf "$HOME/.vimrc.bundles"
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

onedark () {
    echo "copy onedark colorschema"
    if [[ ! -d "$HOME/.vim/colors" ]]; then
        mkdir "$HOME/.vim/colors"
    fi
    if [[ ! -d "$HOME/.vim/autoload" ]]; then
        mkdir "$HOME/.vim/autoload"
    fi
    onedark_path="$HOME/.vim/bundle/onedark.vim"
    colorschema="${onedark_path}/colors/onedark.vim"
    if [[ -f $colorschema ]]; then
        cp $colorschema "$HOME/.vim/colors/onedark.vim"
        echo -e "${Blue}Successfully copy colorschema onedark${Color_off}"
    fi
    load_path="${onedark_path}/autoload/onedark.vim"
    if [[ -f $load_path ]]; then
        cp $load_path "$HOME/.vim/autoload/onedark.vim"
        echo -e "${Blue}Successfully copy autoload onedark${Color_off}"
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
        theme)
            onedark
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

