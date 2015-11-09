filetype off
filetype plugin indent off

if has('vim_starting')
    set runtimepath+=~/dotfiles/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/dotfiles/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'

call neobundle#end()

syntax on
" 画面のスクロール
set nowrap
" 検索
set hlsearch " 検索結果ハイライト 
set ignorecase " 大文字小文字を無視
set smartcase " 検索に大文字を入れた場合大文字小文字を区別
" 自動インデント
set autoindent

set ruler
set number
"set list
set wildmenu
" カラースキーマ設定
set t_Co=256
colorscheme molokai
let g:molokai_origianl=1
set background=dark
highlight Normal ctermbg=none

" lightline settings
set laststatus=2
let g:lightline = {
    \'colorscheme':'wombat'
    \}

set guifont="Ubuntu Mono derivative Powerline Regular"
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab
" クリップボードの共有
set clipboard=unnamed

"~~~~~~~~~~~~~~~~~~~~~
" insert mode settings
"~~~~~~~~~~~~~~~~~~~~~
" インサートモードの時にC-jでノーマルモードに戻る
imap <C-j> <Esc>

" [って打つと[]みたく入力されて、カッコの中に入る
"imap [ []<left>
"imap ( ()<left>
"imap { {}<left>

"~~~~~~~~~~~~~~~~~~~~~
" normal mode settings
"~~~~~~~~~~~~~~~~~~~~~
" ２回Escを押したら検索のハイライトをやめる
nmap <Esc><Esc> :nohlsearch<CR><Esc>

filetype plugin indent on
