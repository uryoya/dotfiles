"===============================================================================
"                   _                                       _        
"            _   __(_)___ ___  ___________________  ___ ___(_)__   _ 
"           | | / / / __ `__ \/ ___/ ___/\___ \__ \/ __` __ \ \ \ | |
"           | |/ / / / / / / / /  / /__    __\ \ \ \ \ \ \ \ \ \ \| |
"           |___/_/_/ /_/ /_/_/   \___/    \___/  \_\_\ \_\ \_\_\___|
"                               ~Dein.vim Edition~
"===============================================================================
" Author : uryoya
" Source : https://github.com/uryoya/dotfiles
" Since  : 2015
"===============================================================================

"dein Scripts-----------------------------
" setting from https://github.com/Shougo/dein.vim/blob/master/bin/installer.sh
if &compatible
  set nocompatible               " Be iMproved
endif

" idea from http://qiita.com/delphinus35/items/00ff2c0ba972c6e41542
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.vim')
" dein.vim本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vimがなければgithubからcloneしてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
call dein#begin(s:dein_dir)

" プラグインリストを収めたTOMLファイル
let s:toml = '~/.vim/rc/dein.toml'
let s:toml_lazy = '~/.vim/rc/dein_lazy.toml'

" TOMLを読み込み、キャッシュしておく
if dein#load_cache([expand('<sfile>'), s:toml, s:toml_lazy])
    call dein#load_toml(s:toml, {'lazy' : 0})
    call dein#load_toml(s:toml_lazy, {'lazy' : 1})
    call dein#save_cache()
endif

call dein#end()

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------


" Vim Settings ---------------------------
let mapleader = "\<Space>"
syntax on
" 画面のスクロール
set nowrap
" 検索
set hlsearch " 検索結果ハイライト 
set ignorecase " 大文字小文字を無視
set smartcase " 検索に大文字を入れた場合大文字小文字を区別
set nowrapscan " 最後の語句の次に最初の語句にループして検索しない
" カーソルの位置表示
set ruler
" 行番号
set number
" 入力中のコマンドを表示する
set showcmd
"set list
set wildmenu
" 補完メニューの高さ
set pumheight=10
" 括弧入力時に、対応する括弧に一瞬飛ぶ
set showmatch
set matchtime=1
" indent
set autoindent " 自動インデント
set shiftwidth=4 " 自動インデント時の空白
set softtabstop=4 " タブキーを押した時の空白
set expandtab " タブを半角スペースにする
set tabstop=4 " タブ文字を表示するときのサイズ
set smarttab " 行との余白内でTabを打ち込むと'shiftwidth'の数だけインデントする。
" enable delete indent, eol, start by backspace
set backspace=indent,eol,start
" クリップボードの共有
set clipboard=unnamed,autoselect
" 80文字目に線を入れる
set colorcolumn=80
" カラースキーマ設定
set t_Co=256
"colorscheme molokai
"colorscheme monokai
"colorscheme lucius
"colorscheme zenburn
"colorscheme sierra
colorscheme hybrid
set background=dark
"highlight Normal ctermbg=none
" スワップファイル作成ディレクトリの指定
set directory=~/.vim/tmp
" DropboxのToDoファイルを編集
command! Todo edit ~/Dropbox/memo/todo.txt

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
" 誤操作したくないキーを無効化
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>
" ; : 入れ替え
nnoremap ; :
nnoremap : ;
" esc バインド
inoremap <silent> jj <Esc>
" 行末までヤンク
nnoremap Y y$
" 数値の増減
nnoremap + <C-a>
nnoremap - <C-x>
" 画面移動
nnoremap <Left> <C-b>
nnoremap <Right> <C-f>
nnoremap <Up> <C-y>
nnoremap <Down> <C-e>
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
" ハイライト切り替え
nnoremap <silent><Leader>h :noh<CR>
" pythonでdocstringを表示しない
"autocmd FileType python setlocal completeopt-=preview

" End Vim Settings -----------------------


" Plugin Settings ------------------------
" Lightline settings
set laststatus=2
let g:lightline = {
    \'colorscheme':'wombat'
    \}
" End

" NERDtree settigs
nnoremap <silent><Leader>e :NERDTreeToggle<CR>
" End

" Neocomplete settings
let g:acp_enableAtStartup = 0   " Disable AutoComplPop
let g:neocomplete#enable_at_startup = 1
let g:neoocmplete#enable_smart_case = 1
" Set minimum syntax keyword lenght.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \}

" Define keyword
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*\'

" Plugin key-mappngs
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complate_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "") . "\<CR>"
endfunction
" <TAB>: completion
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"

