function __peco_select_history
    history | peco | read selected
    if [ $selected ]
        commandline $selected
        commandline -f repaint
    end
end

