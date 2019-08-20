function fish_right_prompt
    # git
    if git_is_repo
        set -l ahead_char "↑"
        set -l behind_char "↓"
        set -l diverged_char "↓↑"
        set -l uptodate_char "✓"
        set -l touched_char "++"
        set -l branch_name (git_branch_name)
        set -l git_ahead_char (git_ahead $ahead_char $behind_char $diverged_char $uptodate_char)

        # set git state
        set git_state $git_ahead_char
        if git_is_touched
            set git_state $touched_char
        end

        # print git branch + status
        print_color yellow "$branch_name $git_state"
    end

    # print datetime
    printf " "
    print_color brblack (date "+%a %H:%M")
end
