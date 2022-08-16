# vim:set ft=zsh:
# License : MIT
# http://mollifier.mit-license.org/
########################################
# 環境変数
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$HOME/.local/bin:$PATH"
[[ $PATH =~ /usr/local/bin ]] || export PATH=/usr/local/bin:$PATH

autoload -Uz colors && colors # 色を使用出来るようにする

# ヒストリの設定
#HISTFILE=~/.zsh_history
#HISTSIZE=1000000
#SAVEHIST=1000000

########################################
# zshオプション
setopt print_eight_bit      # 日本語ファイル名を表示可能にする
setopt no_beep              # beep を無効にする
setopt no_flow_control      # フローコントロールを無効にする
setopt interactive_comments # '#' 以降をコメントとして扱う
setopt auto_pushd           # cd したら自動的にpushdする
setopt pushd_ignore_dups    # 重複したディレクトリを追加しない
setopt share_history        # 同時に起動したzshの間でヒストリを共有する
setopt hist_ignore_all_dups # 同じコマンドをヒストリに残さない
setopt hist_ignore_space    # スペースから始まるコマンド行はヒストリに残さない
setopt hist_reduce_blanks   # ヒストリに保存するときに余分なスペースを削除する
setopt extended_glob        # 高機能なワイルドカード展開を使用する
#setopt auto_cd              # ディレクトリ名だけでcdする

########################################
# キーバインド
bindkey -e
bindkey '^R' history-incremental-pattern-search-backward # ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
function __fzf_repos() {
    ghq list --full-path | fzf --reverse --preview='[ -e {}/README.md ] && bat {}/README.md || echo "README.md not found"' | read repository
    [ -n "$repository" ] && cd $repository
    zle reset-prompt
}
zle -N __fzf_repos
bindkey '^G' __fzf_repos
function __fzf_git_switch() {
    git branch | fzf --reverse | read branch
    [[ -n "$branch" ]] && git switch $branch
    zle reset-prompt
}
zle -N __fzf_git_switch
bindkey '^B' __fzf_git_switch

########################################
# エイリアス
alias ls='ls -F --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias n='nvim'
alias gs='git status --short --branch'
alias gd='git diff'
alias rsyncg='rsync -azv --delete --filter=":- .gitignore"' # rsync git project
alias sudo='sudo ' # sudo の後のコマンドでエイリアスを有効にする

########################################
# antigen https://github.com/zsh-users/antigen
zshdir=$HOME/.zsh
antigenfile=$zshdir/antigen.zsh
if [[ ! -d $zshdir || ! -e $antigenfile ]]; then
    mkdir $zshdir
    curl -L git.io/antigen > $antigenfile
fi
source $antigenfile

antigen bundle zsh-users/zsh-completions         # 補完定義 https://github.com/zsh-users/zsh-autosuggestions
#export ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_STRATEGY=('history' 'completion')
antigen bundle zsh-users/zsh-autosuggestions     # fish風自動補完 https://github.com/zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting # シンタックスハイライト(プラグインのロード順は最後にする必要あり。詳細はリポジトリのREADME.mdを見ること) https://github.com/zsh-users/zsh-syntax-highlighting

antigen apply

########################################
# プロンプト
eval "$(starship init zsh)"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/r_urano/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/r_urano/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/r_urano/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/r_urano/google-cloud-sdk/completion.zsh.inc'; fi
