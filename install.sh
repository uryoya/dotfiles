#! /bin/bash

# ツールのインストール
sudo apt update && sudo apt upgrade -y
sudo apt install zsh tmux vim-gnome
# for neovim
sudo apt install rsync xsel python-pip python3-pip
sudo pip install --upgrade pip && sudo pip3 install --upgrade pip
sudo pip install neovim && sudo pip install neovim jedi
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -sf $HOME/dotfiles/.gvimrc $HOME/.gvimrc
ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

