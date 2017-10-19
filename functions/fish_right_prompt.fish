function fish_right_prompt
    set -l status_color green

    if test $status -ne 0
        set status_color red
    end

    if test "$CMD_DURATION" -gt 50
        set -l duration (printf $CMD_DURATION | humanize_duration)
        print_color $status_color $duration
    else
        print_color brblack (date "+%a %d/%m %H:%M")
    end
end
