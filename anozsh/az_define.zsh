### ---- Key bindings ---- ###
bindkey -e

bindkey "^[[3~" delete-char
bindkey "^[[3;5~" kill-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey '^[[Z' reverse-menu-complete

## Places changes in the order above, IE:
# $TextType $BackgroundColor $TextColor
#
## colored MAN pages ##
export LESS_TERMCAP_mb=$"${S_R}${F_E}"
export LESS_TERMCAP_md=$"${S_R}${B_B}${F_G}"
export LESS_TERMCAP_me=$"${S_R}"
export LESS_TERMCAP_se=$"${S_R}"
export LESS_TERMCAP_so=$"${S_R}${B_E}${F_Y}"
export LESS_TERMCAP_ue=$"${S_R}"
export LESS_TERMCAP_us=$"${S_R}${B_B}${F_M}"
