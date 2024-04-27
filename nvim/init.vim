"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"             /|\        |
"            /N|e\       |\
"           /NN|ee\      |o\    Author:  URANO Ryoya
"           |NN|\ee\     |oo|   License: MIT
"           |NN| \ee\    |oo|
"           |NN|  \ee\   |oo|                III
"           |NN|   \ee\  |oo|   VV       VV
"           |NN|    \ee\ |oo|    VV     VV   III   MMMMM MMMMM
"           |NN|     \ee\|oo|     VV   VV     II   MM   MMM   MM
"           \NN|      \ee|o/       VV VV      II   MM    MM    MM
"            \N|       \e|/         VVV       II   MM    MM    MM
"             \|        \/    init.  V        III  MM    MM    MM for vscode
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------------------------------------
" Vimの設定
"------------------------------------------------------------------------------
" 表示
" syntax on       " シンタックスハイライトをする
" set termguicolors " enable true color
" set ruler       " カーソルの位置表示
" set number      " 行番号
" set showcmd     " 入力中のコマンドを表示する
" set nowrap      " 行を折り返さない
" set pumheight=10    " 補完メニューの高さ
" set colorcolumn=80  " 80文字目に線を入れる
" set ambiwidth=double    " emojiとかがいい感じに表示できる🍣🍣🍣
" set cursorline  " カーソルのある行がハイライトされる
" set hidden      " 保存しなくてもバッファを切り替えることができる

" 不可視文字の表示
set list
" set listchars=tab:»-,trail:›,nbsp:%,eol:¬

" インデント
set autoindent  " 自動インデント
set expandtab   " タブを半角スペースにする
set smarttab    " 行との余白内でTabを打ち込むと'shiftwidth'の数だけインデントする。
set tabstop=4   " タブ文字を表示するときのサイズ
set shiftwidth=4    " 自動インデント時の空白
set softtabstop=4   " タブキーを押した時の空白

" 検索
set hlsearch    " 検索結果ハイライト
set ignorecase  " 大文字小文字を無視
set smartcase   " 検索に大文字を入れた場合大文字小文字を区別
set nowrapscan  " 最後の語句の次に最初の語句にループして検索しない

" 機能
set noswapfile  " スワップフィアルを作らない
set wildmenu    " ファイル名補完の設定
set backspace=indent,eol,start  " バックスペースで色々消せるようにする
set mouse=a
set virtualedit+=block " 矩形選択で自由に移動する- https://vim-jp.org/vim-users-jp/2010/02/17/Hack-125.html

autocmd BufRead,BufNewFile *.sc setfiletype scala
autocmd BufRead,BufNewFile *.sbt setfiletype scala
autocmd FileType json syntax match Comment +\/\/.\+$+

" nvim terminal
let g:terminal_scrollback_buffer_size = 100000

"------------------------------------------------------------------------------
" キーマップ
"------------------------------------------------------------------------------
let mapleader = "\<Space>"
" キーを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" 行末までヤンク
nnoremap Y y$
" 数値の増減
nnoremap + <C-a>
nnoremap - <C-x>
" システムのクリップボードにコピー&ペースト
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" ファイル操作
nnoremap <silent><Leader>q :q<CR>
nnoremap <silent><Leader>w :w<CR>
nnoremap <silent><Leader>z :wq<CR>
" ハイライト切り替え
nnoremap <silent><Leader>h :noh<CR>
" ターミナルから抜ける
tnoremap <Esc> <C-\><C-n>
" 画面分割での移動
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
nnoremap <A->> <C-w>>
nnoremap <A-<> <C-w><
nnoremap <A-+> <C-w>+
nnoremap <A--> <C-w>-

filetype plugin indent on
