"""
fishの自作関数をテキトーに管理する
"""
from pathlib import Path
import configparser
import os
import sys
import argparse

"""
予定：
myfunc [command]
    command:
        install [function] [options]
        uninstall [function] [options]
            インストールとアンインストール
            function: MY_FUNCS_DIRにある自作関数
            options: -a --all MY_FUNCS_DIRにある全ての自作関数をFISH_FUNCS_DIRにインストール/アンインストール
        list
            MY_FUNCS_DIR にある自作関数。インストール済みか、更新済みか表示したい
        show [function] [options]
            `function`の説明を表示(関数を定義したファイルの先頭に書いた説明)
            options: --source でソースコードの表示。できればハイライト

その他：
関数定義した*.fishファイルに依存関係を記述すればgithubとかからインストールしてくるようにしたい
"""


try:
    BASE_DIR = Path(os.environ['HOME']) / 'dotfiles'
    FISH_FUNCS_DIR = Path(os.environ['HOME']) / '.config' / 'fish' / 'functions'
except KeyError:
    raise Exception('環境変数`$HOME`が見つかりません')


def main():
    try: # 設定の読み出し。今のところfish自作関数があるディレクトリパスだけ
        MY_FUNCS_DIR = load_config()
    except Exception as err:
        print(err, file=sys.stderr)
        exit(1)

    MY_FUNCS_DIR = BASE_DIR / MY_FUNCS_DIR
    if not MY_FUNCS_DIR.is_dir():
        print('%s: そのようなディレクトリは見つかりません' % MY_FUNCS_DIR)

    if not FISH_FUNCS_DIR.is_dir(): # ディレクトリがない場合は強制的に作る
        FISH_FUNCS_DIR.mkdir(parents=True)

    # fish関数の読み出し
    # `my_funcs`はdotfilesにある自作関数、`fish_funcs`は初めからあるfish関数や
    # fishのパッケージマネージャでインストールされた関数、自作関数を意味するので、
    # 後でもっとそれらしい名前に変えたい
    my_funcs = load_functions(MY_FUNCS_DIR)
    fish_funcs = load_functions(FISH_FUNCS_DIR)

    parser = argparse.ArgumentParser()
    subparsers = parser.add_subparsers()
    # list
    p_list = subparsers.add_parser('list')
    p_list.add_argument('-a', type=bool)
    p_list.set_defaults(func=show_list)
    # show
    p_list = subparsers.add_parser('show')
    p_list.add_argument('func_name', type=str)
    p_list.set_defaults(func=show_func)
    # install
    p_list = subparsers.add_parser('install')
    p_list.add_argument('func_name', type=str)
    p_list.set_defaults(func=install)
    # uninstall
    p_list = subparsers.add_parser('uninstall')
    p_list.add_argument('func_name', type=str)
    p_list.set_defaults(func=uninstall)
    
    args = parser.parse_args()
    args.func(args, my_funcs, fish_funcs)


def load_config():
    # 設定ファイルの読み出し
    CONFIG_FILE = BASE_DIR / 'fish-myfunc.conf'
    cnf = configparser.ConfigParser()
    if CONFIG_FILE.is_file():
        cnf.read(str(CONFIG_FILE))
        return cnf['myfunc']['myfunc_dir']
    else:
        raise Exception('%s 設定ファイルを作成してください' % CONFIG_FILE)


def load_functions(path):
    return {p.stem: p for p in path.glob('*.fish')}


def show_list(args, my_funcs, fish_funcs):
    """自作関数の一覧を表示."""
    for name, path in my_funcs.items():
        print(name, end='')
        if name in fish_funcs:
            print('\t[installed]')
        else:
            print()


def show_func(args, my_funcs, fish_funcs):
    """関数の詳細を表示."""
    if args.func_name not in my_funcs:
        print('Not Found `{}`'.format(args.func_name))
        exit(1)
    print(my_funcs[args.func_name].read_text())


def install(args, my_funcs, fish_funcs):
    """自作関数を~/.config/fish/functions/にインストール."""
    if args.func_name not in my_funcs:
        print('Not Found `{}`'.format(args.func_name))
        exit(1)
    Path(FISH_FUNCS_DIR / my_funcs[args.func_name].name).write_text(
        my_funcs[args.func_name].read_text()
    )


def uninstall(args, my_funcs, fish_funcs):
    """自作関数を~/.config/fish/functions/からアンインストール."""
    if args.func_name not in fish_funcs:
        print('`{}` is not installed'.format(args.func_name))
        exit(1)
    fish_funcs[args.func_name].unlink()


if __name__ == '__main__':
    main()
