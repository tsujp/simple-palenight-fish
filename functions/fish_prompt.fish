function fish_prompt -d "Palenight fish prompt"
    set -l error_char "😡 "
    set -l superuser_char "⚡️ "

    # root indicator
    test (whoami) = root; and printf $superuser_char

    # current user
    print_color red $USER

    # current working directory
    printf " in "
    print_color yellow (prompt_pwd)

    # git status
    if git_is_repo
        set -l git_char ""
        set -l git_status "✓"
        set -l branch_name (git_branch_name)
        set -l git_state (git_is_touched; and printf "++"; or git_ahead "||>" "<||" "<=>" "")

        printf " on "
        print_color blue "$git_char $branch_name $git_state" (test -n $git_state; and printf " [$git_state]")
    end

     # last command status
    if test $status -eq 0
        print_color green "\e[K\n $error_char ❯ "
    else
        print_color red "\e[K\n $error_char ❯ "
    end
end
