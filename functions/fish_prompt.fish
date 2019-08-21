# non-completion
set fish_color_normal 8be583                        # the default color
set fish_color_command 8be583                       # the color for commands
set fish_color_quote white                          # the color for quoted blocks of text
set fish_color_redirection brwhite                  # the color for IO redirections
set fish_color_end brred --bold                     # the color for process separators like ';' and '&'
set fish_color_error red                            # the color used to highlight potential errors
set fish_color_param brmagenta                      # the color for regular command parameters
# set fish_color_comment                            # the color used for code comments
set fish_color_match yellow                         # the color used to highlight matching parenthesis
# set fish_color_selection                          # the color used when selecting text (in vi visual mode)
set fish_color_search_match --background=brblack    # used to highlight history search matches and the selected pager item (must be a background)
set fish_color_operator brred --bold                # the color for parameter expansion operators like '*' and '~'
set fish_color_escape brwhite                       # the color used to highlight character escapes like '\n' and '\x70'
# set fish_color_cwd   red                          # the color used for the current working directory in the default prompt
set fish_color_autosuggestion blue                  # the color used for autosuggestions
# set fish_color_user                               # the color used to print the current username in some of fish default prompts
# set fish_color_host                               # the color used to print the current host system in some of fish default prompts
set fish_color_cancel brred --bold                  # the color for the '^C' indicator on a canceled command
# completion
set fish_pager_color_prefix red                     # the color of the prefix string, i.e. the string that is to be completed
set fish_pager_color_completion  blue               # the color of the completion itself
set fish_pager_color_description white              # the color of the completion description
set fish_pager_color_progress brwhite               # the color of the progress bar at the bottom left corner
# set fish_pager_color_secondary                    #  the background color of the every second completion

# prompt configuration
function fish_prompt -d "Simple palenight fish"
    set -l command_char "❯ "
    set -l prev_status $status

    # current directory
    print_color red (basename $PWD)
    printf " "

    # last command status
    if test $prev_status -eq 0
        print_color bryellow $command_char
    else
        print_color red $command_char
    end
end
