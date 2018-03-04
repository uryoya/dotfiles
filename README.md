# dotfiles
## インストール

```
# ツールのインストール
sudo apt update && sudo apt upgrade -y
sudo apt install git vim curl
# Python用の環境
sudo apt install python3-venv -y
# For neovim 依存パッケージのインストール
sudo apt install rsync xsel python-pip python3-pip -y
sudo apt-get install neovim -y
sudo pip install --upgrade pip && sudo pip3 install --upgrade pip
sudo pip install neovim && sudo pip3 install neovim jedi

```

## 要件
* vim
    - +lua
* neovim
    - git, rsync, xsel (command in $PATH)
    - +python, +python3 (from pip)
    - jedi (from pip)
* zsh
    - peco
