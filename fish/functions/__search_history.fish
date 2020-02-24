function __search_history
    history | fzf | read -l tmp
    [ -n "$tmp" ] && commandline $tmp
end
