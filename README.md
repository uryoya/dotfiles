# dotfiles
## 使い方
    $ cd dotfiles
    $ dotfilesLink.sh
    $ git submodule init
    $ git submodule update
    $ vim
    : NeoBundleInstall

## httpでインストールした場合
.gitmodulesを以下の通り変更

`url = https://github.com/Shougo/neobundle.vim.git`

## Neovimを使う場合に必要な操作
- pythonのサポート
	$ pip install neovim
	$ pip3 install neovim

- クリップボードの有効化
	$ sudo apt install xsel
