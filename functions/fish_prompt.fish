function fish_prompt -d "Simple fish prompt"
    set -l superuser_char "⚡️ "
    set -l command_char "❯ "



    # current user
    print_color red $USER

    # current working directory
    printf " in "
    print_color yellow (prompt_pwd)

    # git status
    if git_is_repo
        set -l git_char ""
        set -l git_state "✓"
        set -l branch_name (git_branch_name)
        set -l git_ahead_char (git_ahead "||>" "<||" "<=>" "")

        if git_is_touched
            set git_state "++"
        else if test -n $git_ahead_char
            set git_state $git_ahead_char
        end

        printf " on "
        print_color blue "$git_char $branch_name ($git_state)"
    end

    # new line
    printf "\e[K\n"

    # root indicator
    test (whoami) = root; and printf $superuser_char

     # last command status
    if test $status -eq 0
        print_color yellow $command_char
    else
        print_color red $command_char
    end
end
