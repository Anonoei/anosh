### ---- Key bindings ---- ###
bindkey -e

bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^[[Z' reverse-menu-complete

# Clear all values (use default terminal formatting)
NONE='\e[0m'

## Places changes in the order above, IE:
# $TextType $BackgroundColor $TextColor
#
## colored MAN pages ##
man() {
     # mb #
     # md # man titles (ie: NAME, Description, etc)
     # me #
     # se #
     # so # man Bottom Bar
     # ue #
     # us # man References (ie: filename attribute, parameter, zshbuiltins)
  env \
    LESS_TERMCAP_mb=$(printf "${RESET}${bold_blue}") \
    LESS_TERMCAP_md=$(printf "${RESET}${BLACK}${bold_green}") \
    LESS_TERMCAP_me=$(printf "${RESET}") \
    LESS_TERMCAP_se=$(printf "${RESET}") \
    LESS_TERMCAP_so=$(printf "${RESET}${BLUE}${bold_yellow}") \
    LESS_TERMCAP_ue=$(printf "${RESET}") \
    LESS_TERMCAP_us=$(printf "${RESET}${BLACK}${purple}") \
    man "$@"
}