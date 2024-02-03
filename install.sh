#! /bin/bash

# Symlinkを貼って各設定ファイルを有効化
#[ ! -e $HOME/.vimrc ] \
#    && ln -sf $PWD/.vimrc $HOME/.vimrc
#[ ! -d $HOME/.vim ] \
#    && ln -sf $PWD/.vim $HOME/.vim
#[ ! -d $HOME/.config/nvim ] \
#    && ln -sf $PWD/nvim $HOME/.config/nvim
#[ ! -e $HOME/.tmux.conf ] \
#    && ln -sf $PWD/.tmux.conf $HOME/.tmux.conf
#[ ! -e $HOME/.gitconfig ] \
#    && ln -sf $PWD/.gitconfig $HOME/.gitconfig
#[ ! -e $HOME/.config/fish/functions/creel.fish ] \
#    && ln -sf $PWD/fish/creel.fish $HOME/.config/fish/functions/creel.fish
#[ ! -e $HOME/.zshrc ] \
#    && ln -sf $PWD/.zshrc $HOME/.zshrc
#[ ! -e $HOME/.zprofile ] \
#    && ln -sf $PWD/.zprofile $HOME/.zprofile

# Neovimのプラグインマネージャ
plug=$HOME/.config/nvim/autoload/plug.vim
if [ ! -e $plug ]; then
    curl --create-dirs -fLo $plug https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# vim カラースキームのインストール
vimcolorscheme=$HOME/.vim/colors/solarized.vim
if [ ! -e $vimcolorscheme ]; then
    curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" \
        --create-dirs -o $vimcolorscheme
fi

