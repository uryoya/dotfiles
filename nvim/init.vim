" Neovim 

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:toml = '~/.config/nvim/dein/rc/dein.toml'
let s:toml_lazy = '~/.config/nvim/dein/rc/dein_lazy.toml'
if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" Vim Settings ---------------------------
let mapleader = "\<Space>"

" 表示
syntax on       " シンタックスハイライトをする
set ruler       " カーソルの位置表示
set number      " 行番号
set showcmd     " 入力中のコマンドを表示する
set nowrap      " 行を折り返さない
set pumheight=10    " 補完メニューの高さ
set colorcolumn=80  " 80文字目に線を入れる
" カラースキーマ設定
set t_Co=256
colorscheme hybrid
set background=dark

" 括弧入力時に、対応する括弧に一瞬飛ぶ
set showmatch
set matchtime=1

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
"set clipboard=unnamed,autoselect    " クリップボードの共有

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

" Unite.vim settings
nnoremap <leader>f :<C-u>Unite -start-insert file<CR>
" End

" NERDtree settigs
nnoremap <silent><Leader>e :NERDTreeToggle<CR>
" End
" End ------------------------------------
