function __fzf_repos -d 'Search github repositories by ghq'
    ghq list --full-path \
    | fzf --reverse --preview='[ -e {}/README.md ] && bat --color=always --style=header,grid {}/README.md || echo "README.md not found"' \
    | read repository
    [ -n "$repository" ] && cd $repository
    commandline -f repaint # it refresh prompt for keybind (editor command)
end

