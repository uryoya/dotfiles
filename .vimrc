" .vimrc

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
" カラースキーマ設定
set t_Co=256
colorscheme default
" don't create swapfiles
set noswapfile
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

