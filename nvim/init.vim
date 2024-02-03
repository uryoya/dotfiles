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
" Plug 'altercation/vim-colors-solarized'         " カラースキーム
" Plug 'sickill/vim-monokai'
" Plug 'kristijanhusak/vim-hybrid-material'
" Plug 'kaicataldo/material.vim'
" Plug 'drewtempelmeyer/palenight.vim'
" Plug 'luochen1990/rainbow'                      " 括弧の色つけ
" Plug 'itchyny/lightline.vim'                    " ステータスバー
" Plug 'nathanaelkane/vim-indent-guides'          " インデントの可視化
" Plug 'airblade/vim-gitgutter'                   " Gitの状態表示

" ツール
" Plug 'bronson/vim-trailing-whitespace'          " 末尾空白文字の削除
" Plug 'Shougo/denite.nvim'                       " 闇のファイラ
" Plug 'tyru/caw.vim'                             " コメントアウト
" Plug 'cohama/lexima.vim'                        " 括弧の自動挿入
" Plug 'editorconfig/editorconfig-vim'            " EditorConfig
" Plug 'previm/previm'
" Plug 'tyru/open-browser.vim'
" Plug 'Rykka/riv.vim'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'scrooloose/nerdtree', {'do': ':NERDTreeToggle'}

" " プログラミング言語設定
" " [Python]
" Plug 'hynek/vim-python-pep8-indent', {'for': 'python'}  " PEP8インデント
" Plug 'lepture/vim-jinja', {'for': 'python'}             " Jinja
" " Plug 'zchee/deoplete-jedi', {'for': 'python'}           " 補完

" " [Rust]
" Plug 'rust-lang/rust.vim', {'for': 'rust'}              " ハイライト
" " Plug 'sebastianmarkow/deoplete-rust', {'for': 'rust'}   " 補完
" " au! User deoplete-rust call DeopleteRustSetting()

" " [Golang]
" Plug 'fatih/vim-go', {'for': 'go'}
" " Plug 'zchee/deoplete-go', {'for': 'go', 'do': 'make'}
" " au! User deoplete-go call DeopleteGoSetting()

" " [Toml]
" Plug 'cespare/vim-toml', {'for': 'toml'}                " ハイライト

" " [Fish Shell]
" Plug 'dag/vim-fish', {'for': 'fish'}                    " ハイライト

" " [Elm]
" Plug 'elmcast/elm-vim'

" " [Scala]
" Plug 'derekwyatt/vim-scala'

" " [TypeScript]
" Plug 'leafgarland/typescript-vim'

call plug#end()

"------------------------------------------------------------------------------
" プラグインの設定
"------------------------------------------------------------------------------
" let mapleader = "\<Space>"

" " Lightline settings
" set laststatus=2
" let g:lightline = {'colorscheme':'palenight'}
" " let g:lightline = {'colorscheme':'material'}

" " vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'go', 'html', 'php']
" let g:indent_guides_guide_size = 1

" " denite
" call denite#custom#source(
"     \ 'file_rec', 'matchers', ['matcher_fuzzy', 'matcher_ignore_globs'])
" call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
"     \ [ '.git/', '__pycache__/', 'venv/'])
" call denite#custom#var('grep', 'command', ['rg'])
" call denite#custom#var('grep', 'default_opts', ['--vimgrep', '--no-heading'])
" call denite#custom#var('grep', 'recursive_opts', [])
" call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
" call denite#custom#var('grep', 'separator', ['--'])
" call denite#custom#var('grep', 'final_opts', [])
" nmap <silent> <Leader>f :<C-u>Denite file_rec -default-action=vsplit<CR>
" nmap <silent> <Leader>b :<C-u>Denite buffer<CR>

" " NERDTree
" nmap <silent> <Leader>e :<C-u>NERDTreeToggle<CR>

" " deoplete
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#auto_complete_delay = 0

" " deoplete-go
" function DeopleteGoSetting()
"     let g:deoplete#sources#go#gocode_binary = $HOME.'/go/bin/gocode'
"     let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" endfunction

" " deoplete-rust
" function DeopleteRustSetting()
"     let g:deoplete#sources#rust#racer_binary = $HOME.'/.cargo/bin/racer'
"     let g:deoplete#sources#rust#rust_source_path = $HOME.'/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src'
" endfunction

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

" 指定の背景色を透過
" autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
" " autocmd ColorScheme * highlight VertSplit ctermbg=none guibg=none
" autocmd ColorScheme * highlight Pmenu ctermbg=none guibg=none
" autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
" " コードコメントのハイライトを明るく
" autocmd ColorScheme * highlight Comment	ctermfg=246 cterm=italic guifg=#93a1a1 gui=italic

" colorscheme palenight

" let g:enable_bold_font = 1
" let g:enable_italic_font = 1
" let g:hybrid_transparent_background = 1
" colorscheme hybrid_material

" let g:material_terminal_italics = 1
" let g:material_theme_style = 'darker'
" colorscheme material

" 括弧
" let g:rainbow_active = 1

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

"------------------------------------------------------------------------------
" Coc.nvim
"------------------------------------------------------------------------------
" " if hidden is not set, TextEdit might fail.
" set hidden

" " Some servers have issues with backup files, see #649
" set nobackup
" set nowritebackup

" " Better display for messages
" set cmdheight=2

" " You will have bad experience for diagnostic messages when it's default 4000.
" set updatetime=300

" " don't give |ins-completion-menu| messages.
" set shortmess+=c

" " always show signcolumns
" set signcolumn=yes

" " Use tab for trigger completion with characters ahead and navigate.
" " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" " Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" " Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" " Remap keys for gotos
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" " Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   else
"     call CocAction('doHover')
"   endif
" endfunction

" " Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" " Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)

" " Remap for format selected region
" xmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" " Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" " Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" " Fix autofix problem of current line
" nmap <leader>qf  <Plug>(coc-fix-current)

" " Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" " Use `:Format` to format current buffer
" command! -nargs=0 Format :call CocAction('format')

" " Use `:Fold` to fold current buffer
" command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" " use `:OR` for organize import of current buffer
" command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" " Add status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" " Using CocList
" " Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions
" " nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" " Show commands
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"------------------------------------------------------------------------------
" 最後に設定したほうがいい系の設定
"------------------------------------------------------------------------------
filetype plugin indent on

