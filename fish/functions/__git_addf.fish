function __git_addf -d 'git add with fzf'
    set -l selected (unbuffer git status -s | fzf -m --reverse --border --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff | delta --syntax-theme 'Dracula'" | awk '{print $2}')
    if [ -n "$selected" ]
        set -l formated_s (echo $selected | tr '\n' ' ' | sed 's/ $//g')
        set -l formated_s (echo $formated_s | string split ' ')
        git add {$formated_s}
    end
end

