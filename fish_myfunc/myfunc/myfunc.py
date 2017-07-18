"""
dotfilesをテキトーに管理する
"""
from pathlib import Path
import configparser
import os, sys

def main():
    cnf = configparser.ConfigParser()
    try:
        DOTFILES_DIR = Path(os.environ['HOME']) / 'dotfiles'
    except KeyError:
        print('環境変数`$HOME`が見つかりません', file=sys.stderr)
        exit(0)

    CONFIG_FILE = Path(DOTFILES_DIR) / 'dotmanage.conf'
    if CONFIG_FILE.exists():
        cnf.read(CONFIG_FILE)
    else:
        print(f'{DOTFILES_DIR}直下に`dotmanage.conf`設定ファイルを作成してください', file=sys.stderr)
        exit()

if __name__ == '__main__':
    main()
