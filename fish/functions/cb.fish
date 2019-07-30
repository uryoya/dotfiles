function cb --description 'Copy to clipboard'
    set -l options 'h/help'
    if set -q _flag_help
        __fish_print_help cb
        return 0
    end

    if type -q -f pbcopy
        pbcopy
    else if type -q -f xsel
        xsel -b
    else
        echo (_ 'No clipboad utility found. Try installing "xsel".')
    end
end

