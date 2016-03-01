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

" Required:
set runtimepath^=~/.vim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
" UI tools
call dein#add('itchyny/lightline.vim')  " Statusline/tabline plugin
call dein#add('scrooloose/nerdtree')    " Showing file tree plugin
" Input utility
call dein#add('Shougo/neocomplete.vim') " 
" By filetype or kind utils
call dein#add('editorconfig/editorconfig-vim')  " EditorConfig vim plugin
" Color scheme
call dein#add('tomasr/molokai')
call dein#add('sickill/vim-monokai')
call dein#add('jonathanfilip/vim-lucius')
call dein#add('jnurmine/zenburn')
call dein#add('AlessandroYorba/Sierra')

"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
"call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
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
" 自動インデント
set autoindent
" スペルチェック
" set spell
" set spelllang=en,cjk " 有効：英語、無効：日本語
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
" カラースキーマ設定
set t_Co=256
colorscheme molokai
"colorscheme monokai
"colorscheme lucius
"colorscheme zenburn
"colorscheme sierra
set background=dark
highlight Normal ctermbg=none
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
" ハイライト切り替え
nnoremap <silent><Leader>h :noh<CR>

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

