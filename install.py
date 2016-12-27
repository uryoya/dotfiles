#!/usr/bin/env python3
"""
dotfilesをシステムにインストールする
"""
from pathlib import Path
from argparse import ArgumentParser


DOTFILES_DIR = Path.home() / 'dotfiles'

dotfiles = [
#   [Dotfileのパス,  ターゲットファイルのパス]
    [DOTFILES_DIR / '.Xresources', Path.home() / '.Xresources'],
    [DOTFILES_DIR / '.vimrc', Path.home() / '.vimrc'],
    [DOTFILES_DIR / '.gvimrc', Path.home() / '.gvimrc'],
    [DOTFILES_DIR / '.vim', Path.home() / '.vim'],
    [DOTFILES_DIR / 'nvim', Path.home() / '.config/nvim'],
    [DOTFILES_DIR / '.zshrc', Path.home() / '.zshrc'],
    [DOTFILES_DIR / '.zshenv', Path.home() / '.zshenv'],
    [DOTFILES_DIR / '.bashrc', Path.home() / '.bashrc'],
    [DOTFILES_DIR / '.tmux.conf', Path.home() / '.tmux.conf'],
]

def install():
    """ インストール """
    for src, target in dotfiles:
        if target.exists():
            target.rename(target.name + '.org')
        target.symlink_to(src)

def uninstall():
    """ アンインストール """
    for src, symlink in dotfiles:
        if symlink.is_symlink():
            symlink.unlink()


if __name__ == '__main__':
    parser = ArgumentParser()
    parser.add_argument('--uninstall', action='store_true')
    argv = parser.parse_args()

    if argv.uninstall:
        uninstall()
    else:
        install()
