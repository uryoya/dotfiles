function creel -d "manage fish functions"
    if not set -q __creel_managed_dirs
        set -U __creel_managed_dirs
    end

    argparse -s --name="creel" "h/help" -- $argv
    or return 1

    if set -q _flag_help
        __creel_help
        return
    end

    switch $argv[1]
        case "add"
            __creel_add $argv[2]
        case "delete"
            __creel_delete $argv[2]
        case "update"
            __creel_update
        case "list"
            __creel_list
        case '*'
            echo $argv[1]": unknown command"
            __creel_help
            return 1
    end
end

function __creel_help
    echo """creel usage:
    creel -h / --help       Show this help
    creel add <directory>   Add directory to manage list
    creel delete <directory Delete directory from manage list
    creel list              Show managed directories"""
end

function __creel_add
    if test -d $argv[1] && not contains $argv[1] $__creel_managed_dirs
        set -U __creel_managed_dirs $__creel_managed_dirs $argv[1]
        for fish_function in (ls $argv[1]/*.fish)
            ln -sf $fish_function $HOME/.config/fish/functions/ \
                && echo "added function:" $fish_function
        end
    end
end

function __creel_delete
    if contains $argv[1] $__creel_managed_dirs
        for fish_function in (ls $argv[1]/*.fish)
            set -l delete_function $HOME/.config/fish/functions/(basename $fish_function)
            rm $delete_function && echo "deleted function:" $delete_function
        end
        set -e __creel_managed_dirs[(contains -i $argv[1] $__creel_managed_dirs)]
    end
end

function __creel_update
    echo "`update` is not implemented"
end

function __creel_list
    echo $__creel_managed_dirs | tr ' ' '\n'
end
