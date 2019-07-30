function nn
    nvim (find . -type f | grep -v .git/ | fzf)
end
