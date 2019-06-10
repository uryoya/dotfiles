function today
    set filepath ~/.today.txt
    nvim $filepath
    cat $filepath | cb
    echo 'copyed to clipboard!'
end
