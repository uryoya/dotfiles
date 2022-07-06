#! /bin/bash

# Symlinkを貼って各設定ファイルを有効化
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -sf $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -sf $HOME/dotfiles/fish/creel.fish $HOME/.config/fish/functions/creel.fish
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.zprofile $HOME/.zprofile

# Neovimのプラグインマネージャ
plug=$HOME/.config/nvim/autoload/plug.vim
if [ ! -e $plug ]; then
    curl -fLo  --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# vim カラースキームのインストール
vimcolorscheme=$HOME/.vim/colors/solarized.vim
if [ ! -e $vimcolorscheme ]; then
    curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" \
        --create-dirs -o $vimcolorscheme
fi

