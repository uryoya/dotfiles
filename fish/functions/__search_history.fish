function __search_history
    history | fzf --reverse | read -l tmp
    [ -n "$tmp" ] && commandline $tmp
end
