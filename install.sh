#! /bin/bash

# install vim config
install_vim () {
    [ ! -e $HOME/.vimrc ] \
       && ln -sf $PWD/.vimrc $HOME/.vimrc
    [ ! -d $HOME/.vim ] \
       && ln -sf $PWD/.vim $HOME/.vim

    # vim カラースキームのインストール
    vimcolorscheme=$HOME/.vim/colors/solarized.vim
    if [ ! -e $vimcolorscheme ]; then
        curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" \
            --create-dirs -o $vimcolorscheme
    fi
}

# install neovim config
install_neovim () {
    [ ! -d $HOME/.config/nvim ] \
       && ln -sf $PWD/nvim $HOME/.config/nvim

    # Neovimのプラグインマネージャ
    plug=$HOME/.config/nvim/autoload/plug.vim
    if [ ! -e $plug ]; then
        curl --create-dirs -fLo $plug https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
}

# install tmux config
install_tmux () {
    [ ! -e $HOME/.tmux.conf ] \
       && ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
}

# install git config
install_git () {
    [ ! -e $HOME/.gitconfig ] \
       && ln -sf $PWD/.gitconfig $HOME/.gitconfig
}

# install zsh config
install_zsh () {
    [ ! -e $HOME/.zshrc ] \
       && ln -sf $PWD/.zshrc $HOME/.zshrc
    [ ! -e $HOME/.zprofile ] \
       && ln -sf $PWD/.zprofile $HOME/.zprofile
}

# install fish config
install_fish () {
    [ ! -e $HOME/.config/fish ] \
       && ln -sf $PWD/fish $HOME/.config/fish
}

# check and install configs
read -n1 -p "install vim config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_vim && echo "vim config installed!"
else
    echo
fi

read -n1 -p "install neovim config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_neovim && echo "neovim config installed!"
else
    echo
fi

read -n1 -p "install tmux config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_tmux && echo "tmux config installed!"
else
    echo
fi

read -n1 -p "install git config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_git && echo "git config installed!"
else
    echo
fi

read -n1 -p "install zsh config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_zsh && echo "zsh config installed!"
else
    echo
fi

read -n1 -p "install fish config?: " yn
if [[ $yn = [yY] ]]; then
    echo
    install_fish && echo "fish config installed!"
else
    echo
fi

