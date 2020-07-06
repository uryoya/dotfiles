function rsyncg -d 'rsync git project'
    rsync -azv --delete --filter=':- .gitignore' $argv
end
