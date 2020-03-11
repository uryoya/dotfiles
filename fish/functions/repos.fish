function repos -d 'Search github repositories by ghq'
    ghq list --full-path | fzf --preview "__preview_repos_readme {}" | read repository
    [ -n "$repository" ] && cd $repository
    commandline -f repaint # it refresh prompt for keybind (editor command)
end

