#! /bin/bash

# Git configの設定
git config --global user.email "urano.works.mail@gmail.com"
git config --global user.name "URANO Ryoya"

# Symlinkを貼って各設定ファイルを有効化
ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

# Neovim用に使うプラグインマネージャ
curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# For vim カラースキームのインストール
curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" \
    --create-dirs -o $HOME/.vim/colors/solarized.vim

# fishを起動するように(デフォルトシェルは変えない)
# echo "exec fish" >> $HOME/.bashrc

