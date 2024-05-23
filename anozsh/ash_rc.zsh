#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_VERSION="0.7.0"
ASH_VER_PATH="ash_rc.zsh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anozsh"

source "${ASH_PATH}/common/verify_paths.sh"

ASH_PATH_SETTINGS="${ASH_PATH_USER}/ash_zsh_settings.zsh"

if [ ! -f "$ASH_PATH_SETTINGS" ]; then
    local settings_defalt='
### ---- AnoSH ZSH User Settings ---- ###
alias edit=vim'
    echo $settings_default > "$ASH_PATH_SETTINGS"
fi

source "$ASH_PATH_SETTINGS"

source "${ASH_PATH_COMMON}/init.sh"

source "${ASH_PATH_ROOT}/ash_config.zsh"
source "${ASH_PATH_ROOT}/ash_define.zsh"
source "${ASH_PATH_ROOT}/ash_plugins.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
