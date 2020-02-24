function fish_prompt --description 'Write out the prompt'
	set -l last_status $status

    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_hide_untrackedfiles 1

    set -g __fish_git_prompt_color_branch magenta --bold
    set -g __fish_git_prompt_showupstream "informative"
    set -g __fish_git_prompt_char_upstream_ahead "↑"
    set -g __fish_git_prompt_char_upstream_behind "↓"
    set -g __fish_git_prompt_char_upstream_prefix ""

    set -g __fish_git_prompt_char_stagedstate "A"
    set -g __fish_git_prompt_char_dirtystate "M"
    set -g __fish_git_prompt_char_untrackedfiles "?¿"
    set -g __fish_git_prompt_char_invalidstate "x"
    set -g __fish_git_prompt_char_cleanstate "o"

    set -g __fish_git_prompt_color_dirtystate red
    set -g __fish_git_prompt_color_stagedstate green
    set -g __fish_git_prompt_color_invalidstate red
    set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
    set -g __fish_git_prompt_color_cleanstate green --bold

    set -g __fish_prompt_normal (set_color normal)

    set -l color_cwd
    set -l prefix
    set -l suffix
    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
            set suffix '#'
        case '*'
            set color_cwd $fish_color_cwd
            set suffix '$'
    end

    # PWD
    printf "╭ [%s@%s] " (whoami) (prompt_hostname)
    set_color $color_cwd
    echo (echo $PWD | sed -e "s|^$HOME|~|")
    set_color normal

    printf '╰%s ' (__fish_vcs_prompt)

    if not test $last_status -eq 0
        set_color $fish_color_error
        echo -n "[$last_status] "
        set_color normal
    end

    echo -n "$suffix "
end
