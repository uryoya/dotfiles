#!/usr/bin/env python3
from pathlib import Path


DOTFILES_DIR = Path.home() / 'dotfiles'

dotfiles = [
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

for src, target in dotfiles:
    if target.exists():
        target.rename(target.name + '.org')
    src.symlink_to(target)
