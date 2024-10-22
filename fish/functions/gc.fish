function gc -d 'Gitブランチから検索して移動する'
    # ディレクトリがGitリポジトリでない場合は何もしない
    git status 1> /dev/null || return

    git branch --format '%(refname:lstrip=2)' \
    | fzf --reverse \
    | read branch
    [ -n "$branch" ] && git switch $branch
end
