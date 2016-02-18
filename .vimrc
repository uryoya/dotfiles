"        _                    
" _   __(_)___ ___  __________
"| | / / / __ `__ \/ ___/ ___/
"| |/ / / / / / / / /  / /__  
"|___/_/_/ /_/ /_/_/   \___/  
"                             

" vi互換モードで動作させない
set nocompatible
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
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'

call neobundle#end()

" シンタックスハイライト
syntax on
" 画面のスクロール
set nowrap
" 検索
set hlsearch " 検索結果ハイライト 
set ignorecase " 大文字小文字を無視
set smartcase " 検索に大文字を入れた場合大文字小文字を区別
set nowrapscan " 最後の語句の次に最初の語句にループして検索しない
" 自動インデント
set autoindent
" スペルチェック
set spell
set spelllang=en,cjk " 有効：英語、無効：日本語
" カーソルの位置表示
set ruler
" 行番号
set number
" 入力中のコマンドを表示する
set showcmd
"set list
set wildmenu
" カラースキーマ設定
set t_Co=256
colorscheme molokai
let g:molokai_origianl=1
set background=dark
highlight Normal ctermbg=none
" スワップファイル作成ディレクトリの指定
set directory=~/.vim/tmp
" DropboxのToDoファイルを編集
command! Todo edit ~/Dropbox/memo/todo.txt

"--------------------------------------------------
" プラグインの設定
"--------------------------------------------------
" lightline settings
set laststatus=2
let g:lightline = {
    \'colorscheme':'wombat'
    \}
" end

" neocomplete.vim と jedi.vimの連携
autocmd FileType python setlocal omnifunc=jedi#completions

let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
            let g:neocomplete#force_omni_input_patterns = {}
endif
" end

" nerdtree settigs
nnoremap <silent><C-e> :NERDTreeToggle<CR>
" end
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'
let g:neocomplete#enable_at_startup = 1

" markdown settings
au BufRead,BufNewFile *.md set filetype=markdown
" end

" 自動インデント時の空白
set shiftwidth=4
" タブキーを押した時の空白
set softtabstop=4
" タブを半角スペースにする
set expandtab
" タブ文字を表示するときのサイズ
set tabstop=4
" 行との余白内でTabを打ち込むと'shiftwidth'の数だけインデントする。
set smarttab
" クリップボードの共有
set clipboard=unnamed,autoselect

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
