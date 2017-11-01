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
"             \|        \/    init.  V        III  MM    MM    MM
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"------------------------------------------------------------------------------
" プラグインの導入(Vim Plug)
"------------------------------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')

" 表示
Plug 'altercation/vim-colors-solarized'         " カラースキーム
Plug 'itchyny/lightline.vim'                    " ステータスバー
Plug 'nathanaelkane/vim-indent-guides'          " インデントの可視化
Plug 'airblade/vim-gitgutter'                   " Gitの状態表示

" ツール
Plug 'bronson/vim-trailing-whitespace'          " 末尾空白文字の削除
Plug 'Shougo/denite.nvim'                       " 闇のファイラ
Plug 'tyru/caw.vim'                             " コメントアウト
Plug 'cohama/lexima.vim'                        " 括弧の自動挿入
Plug 'editorconfig/editorconfig-vim'            " EditorConfig
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', {'do': ':NERDTreeToggle'}

" プログラミング言語設定
" [Python]
Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}  " PEP8インデント
Plug 'lepture/vim-jinja', {'for': 'python'}             " Jinja
Plug 'zchee/deoplete-jedi', {'for': 'python'}           " 補完

" [Rust]
Plug 'rust-lang/rust.vim', {'for': 'rust'}              " ハイライト
Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}   " 補完
au! User deoplete-rust call DeopleteRustSetting()

" [Golang]
Plug 'fatih/vim-go', {'for': 'go'}
Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
au! User deoplete-go call DeopleteGoSetting()

" [Toml]
Plug 'cespare/vim-toml', {'for': 'toml'}                " ハイライト

" [Fish Shell]
Plug 'dag/vim-fish', {'for': 'fish'}                    " ハイライト

call plug#end()

"------------------------------------------------------------------------------
" プラグインの設定
"------------------------------------------------------------------------------
let mapleader = "\<Space>"
" solarized color toggle
call togglebg#map("<F5>")

" Lightline settings
set laststatus=2
let g:lightline = {'colorscheme':'solarized'}

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'go', 'html', 'php']
let g:indent_guides_guide_size = 1

" denite
call denite#custom#source(
    \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
    \ [ '.git/', '__pycache__/', 'venv/'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
nmap <silent> <Leader>f :<C-u>Denite file_rec -default-action=vsplit<CR>
nmap <silent> <Leader>b :<C-u>Denite buffer<CR>

" NERDTree
nmap <silent> <Leader>e :<C-u>NERDTreeToggle<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

" deoplete-go
function DeopleteGoSetting()
    let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
    let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
endfunction

" deoplete-rust
function DeopleteRustSetting()
    let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
    let g:deoplete#sources#rust#rust_source_path = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
endfunction

"------------------------------------------------------------------------------
" Vimの設定
"------------------------------------------------------------------------------
" 表示
syntax on       " シンタックスハイライトをする
"set termguicolors " enable true color
set ruler       " カーソルの位置表示
set number      " 行番号
set showcmd     " 入力中のコマンドを表示する
set nowrap      " 行を折り返さない
set pumheight=10    " 補完メニューの高さ
set colorcolumn=80  " 80文字目に線を入れる
set ambiwidth=double    " emojiとかがいい感じに表示できる🍣🍣🍣
set cursorline  " カーソルのある行がハイライトされる
"set termguicolors   " True color (solarizedが正しく表示されないので外した)
set hidden      " 保存しなくてもバッファを切り替えることができる
let g:solarized_termtrans = 0 " 背景透過
set background=dark
colorscheme solarized

" 不可視文字の表示
set list
set listchars=tab:»-,trail:-,nbsp:%,eol:¬

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

" nvim terminal
let g:terminal_scrollback_buffer_size = 100000
" Neovim config
if has('unix')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

"------------------------------------------------------------------------------
" キーマップ
"------------------------------------------------------------------------------
" helpを使いやすくする idea from http://haya14busa.com/reading-vim-help/
nnoremap <Leader>t :<C-u>tab help<Space>
nnoremap <Leader>v :<C-u>vertical belowright help<Space>

" MoveToNewTab
nnoremap <silent> tm :<C-u>call <SID>MoveToNewTab()<CR>
function! s:MoveToNewTab()
    tab split
    tabprevious

    if winnr('$') > 1
        close
    elseif bufnr('$') > 1
        buffer #
    endif

    tabnext
endfunction

" キーを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" ; : 入れ替え
"nnoremap ; :
"nnoremap : ;
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

"------------------------------------------------------------------------------
" 最後に設定したほうがいい系の設定
"------------------------------------------------------------------------------
filetype plugin indent on

