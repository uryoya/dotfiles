# vim:set ft=zsh:

# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/

########################################
# 環境変数
export LANG=ja_JP.UTF-8
export QT_IM_MODULE=fcitx
export GOPATH=$HOME/.go
export XDG_CONFIG_HOME=$HOME/.config

# PATHにない場合に追加
[[ $PATH =~ /usr/local/bin ]] || export PATH=/usr/local/bin:$PATH
[[ $PATH =~ $HOME/.go/bin ]] || export PATH=$HOME/.go/bin:$PATH

# 色を使用出来るようにする
autoload -Uz colors && colors

# vi 風キーバインドにする
bindkey -v

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

########################################
# プロンプト
#PROMPT="%(?.%F{210}%n@%m❯.%F{009}%n@%m❯) %f"
PROMPT="%(?.%F{210}❯.%F{009}❯) %f"
#PROMPT="%(?.%F{047}✓ .%F{009}✗ )%F{210}❯ %f"
RPROMPT="%F{078}❮ %~${vcs_info_msg_0_}"
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

# vcs_info の設定
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "[+]"
zstyle ':vcs_info:git:*' unstagedstr "[?]"
zstyle ':vcs_info:*' formats '❮%F{104}❮ %b%c%u%f'
zstyle ':vcs_info:*' actionformats '❮%F{009}❮ %b|%a%c%u%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="%F{078}❮ %~${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


# 単語の区切り文字を指定する
autoload -Uz select-word-style && select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit && compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                   /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd
# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

########################################
# エイリアス

alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias gs='git status --short --branch'
alias g='git'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

########################################
# zplug
if [[ -d $HOME/.zplug ]]; then
  source $HOME/.zplug/init.zsh
else
  curl -sL zplug.sh/installer | zsh
  source $HOME/.zplug/init.zsh
fi

zplug "zsh-users/zsh-syntax-highlighting", use:"zsh-syntax-highlighting.zsh", defer:2
zplug "zsh-users/zsh-completions"
zplug "mollifier/anyframe"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  else
    echo
  fi
fi

zplug load

# anyframe
bindkey '^r' anyframe-widget-put-history

# exec tmux
[[ -z "$TMUX" ]] && exec tmux

