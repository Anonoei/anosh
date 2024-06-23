export ASH_HOME="https://github.com/anonoei/anosh"
export ASH_DOWN="https://raw.githubusercontent.com/anonoei/anosh/main"

export ASH_PLUGS=()

source "${ASH_PATH_COMMON}/cli.sh"

source "${ASH_PATH_COMMON}/colors.sh"
source "${ASH_PATH_COMMON}/plugins.sh"
source "${ASH_PATH_COMMON}/funcs.sh"
source "${ASH_PATH_COMMON}/alias.sh"

for filepath in ${ASH_PATH_ROOT}/extras/*; do
    source "${filepath}"
done

### ---- Initialize everything else ---- ###
if [[ $- == *i* ]]; then # interactive shell
    if [[ ${ASH_PLUGS[@]} =~ "starship" ]]; then
        eval "$(starship init $ASH_SHELL)"
    fi

    if [[ ! ${ASH_PLUGS[@]} =~ "zoxide" ]]; then
        eval "$(zoxide init $ASH_SHELL)"
    fi

    if [[ ! ${ASH_PLUGS[@]} =~ "atuin" ]]; then
        if [[ $ASH_SHELL == "bash" ]]; then
            [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
        fi
        eval "$(atuin init $ASH_SHELL)"
    fi
fi
