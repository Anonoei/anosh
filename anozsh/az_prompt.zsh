setprompt() {
    setopt prompt_subst
    # man zshmisc

    # <username>@<hostname>:<current-directory [<vsc_info>] >
    PS1=${(j::Q)${(Z:Cn:):-$'
        ${default}%n                # Username
        ${blue}@                    # @
        ${default}%m                # Hostname
        ${blue}:                    # :
        ${green}%~                  # Current Directory
        ${RESET}$vcs_info_msg_0_    # Version control info
        ${white}" ">                # Prompt
        ${RESET}" "
    '}}

    PS2=$'%_>'
    RPROMPT=' ${default}%D{%j %U %F %T%z}${RESET}'
}
setprompt