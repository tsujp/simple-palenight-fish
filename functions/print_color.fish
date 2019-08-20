function print_color -a color string
    set_color $color
    printf $string
    set_color $fish_color_normal
end
