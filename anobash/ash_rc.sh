#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_VERSION="0.7.1"
ASH_VER_PATH="ash_rc.sh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anobash"

source "${ASH_PATH}/common/verify_paths.sh"

ASH_PATH_SETTINGS="${ASH_PATH_USER}/ash_bash_settings.sh"

if [ ! -f "$ASH_PATH_SETTINGS" ]; then
    settings_defalt='
### ---- AnoSH BASH User Settings ---- ###
alias edit=vim'
    echo $settings_default > "$ASH_PATH_SETTINGS"
fi

source "$ASH_PATH_SETTINGS"

source "${ASH_PATH_COMMON}/init.sh"

source "${ASH_PATH_ROOT}/ash_config.sh"
source "${ASH_PATH_ROOT}/ash_define.sh"
source "${ASH_PATH_ROOT}/ash_plugins.sh"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
