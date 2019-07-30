function no --description 'search file by fzf and open in NVim'
    nvim (find . | fzf --reverse)
end
