function __preview_repos_readme
    if [ -e $argv[1]/README.md ]
        bat  --color=always --style=header,grid $argv[1]/README.md
    end
end
