function __peco_select_history
    history | sort | uniq | peco | read selected
    if [ $selected ]
        commandline $selected
        commandline -f repaint
    end
end

