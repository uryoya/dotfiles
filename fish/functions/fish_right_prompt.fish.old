function fish_right_prompt -d 'Write out the right prompt'
    set -l last_status $status
    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n "[$last_status] "
        set_color normal
    end
    echo (date '+%T')
end
