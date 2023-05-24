# Initialize colors
SupportedColors=0
autoload colors && colors
# foreground colors are lowercase, background colors UPPERCASE
typeset -AHg fg fg_bold fg_no_bold
for k in ${(k)color[(I)fg-*]}; do # foreground colors
    name=${k#fg-} # Get color names from autoload colors, remove 'fg-' prefix
    nameLower="${(L)name}"
    eval $nameLower='%{$fg_no_bold[${(L)name}]%}' # wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval bold_$nameLower='%{$fg_bold[${(L)name}]%}'
    let "SupportedColors=SupportedColors+1"
done
let "SupportedColors=SupportedColors*2" # for bold/non-bold
typeset -AHg bg bg_bold bg_no_bold
for k in ${(k)color[(I)bg-*]}; do # BACKGROUND colors
    name=${k#bg-} # Get color names from autoload colors, remove 'bg-' prefix
    nameUpper="${(U)name}"
    eval $nameUpper='%{$bg_no_bold[${(L)name}]%}' # wrap colours between %{ %} to avoid weird gaps in autocomplete
    eval BOLD_$nameUpper='%{$bg_bold[${(L)name}]%}'
done
eval RESET='%{$reset_color%}'