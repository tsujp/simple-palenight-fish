function fish_right_prompt
    set -l status_color yellow
    set -l status_char "😄 "

    if test $status -ne 0
        set status_color red
        set status_char "😡 "
    end

    if test "$CMD_DURATION" -gt 50
        set -l duration (printf $CMD_DURATION | humanize_duration)
        print_color $status_color "$status_char $duration"
    else
        print_color brblack (date "+%a %H:%M")
    end

    # new line
    printf "\e[K\n"
end
