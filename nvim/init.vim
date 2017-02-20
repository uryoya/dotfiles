" Neovim 

"-------------------------------------------------------------------------------
" dein の設定
"-------------------------------------------------------------------------------
let s:dein_dir = expand('~/.config/nvim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim.git' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

let s:toml = expand('~/.config/nvim/rc/dein.toml')
let s:toml_lazy = expand('~/.config/nvim/rc/dein_lazy.toml')
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


"-------------------------------------------------------------------------------
" Vimの設定
"-------------------------------------------------------------------------------
let mapleader = "\<Space>"

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
set termguicolors   " True color
colorscheme onedark

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

" helpを使いやすくする idea from http://haya14busa.com/reading-vim-help/
nnoremap <Leader>t :<C-u>tab help<Space>
nnoremap <Leader>v :<C-u>vertical belowright help<Space>

" Neovim config
if has('unix')
    let g:python_host_prog = '/usr/bin/python2'
    let g:python3_host_prog = '/usr/bin/python3'
endif

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


"-------------------------------------------------------------------------------
" プラグインの設定
"-------------------------------------------------------------------------------
" Lightline settings
set laststatus=2
let g:lightline = {
    \'colorscheme':'onedark'
    \}

" Unite.vim settings
nnoremap <leader>f :<C-u>Unite -start-insert file<CR>

" NERDtree settigs
nnoremap <silent><Leader>e :NERDTreeToggle<CR>
