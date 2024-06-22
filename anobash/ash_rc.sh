#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_VERSION="0.8.0"
ASH_VER_PATH="ash_rc.sh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anobash"

source "${ASH_PATH}/common/verify_paths.sh"

ash_init_settings ".ash_bashrc" '### ---- AnoSH BASH User Settings ---- ###
alias edit=nvim
EDITOR=edit
VISUAL=edit

alias vi=edit
alias vim=edit
'

### ---- Initialize anosh ---- ###
source "${ASH_PATH_COMMON}/init.sh"

source "${ASH_PATH_ROOT}/ash_config.sh"
source "${ASH_PATH_ROOT}/ash_define.sh"
source "${ASH_PATH_ROOT}/ash_plugins.sh"

### ---- Initialize everything else ---- ###
if [[ ${ASH_PLUGS[@]} =~ "starship" ]]; then
    eval "$(starship init bash)"
fi

if [[ ! ${ASH_PLUGS[@]} =~ "zoxide" ]]; then
    eval "$(zoxide init bash)"
fi

if [[ ! ${ASH_PLUGS[@]} =~ "atuin" ]]; then
    [[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
    eval "$(atuin init bash)"
fi
