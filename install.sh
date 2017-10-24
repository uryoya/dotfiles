#! /bin/bash

# ツールのインストール
sudo apt update && sudo apt upgrade -y
sudo apt install git vim

# git
git config --global user.email "urano.works.mail@gmail.com"
git config --global user.name "URANO Ryoya"

# python
sudo apt install python3-venv

# for neovim
sudo apt install rsync xsel python-pip python3-pip curl
sudo pip install --upgrade pip && sudo pip3 install --upgrade pip
sudo pip install neovim && sudo pip3 install neovim jedi
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

curl "https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim" \
    --create-dirs -o $HOME/.vim/colors/solarized.vim

ln -sf $HOME/dotfiles/.vimrc $HOME/.vimrc
# ln -sf $HOME/dotfiles/.gvimrc $HOME/.gvimrc
# ln -sf $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -sf $HOME/dotfiles/.vim $HOME/.vim
ln -sf $HOME/dotfiles/nvim $HOME/.config/nvim
ln -sf $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

