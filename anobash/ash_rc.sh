#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_VERSION="0.7.2"
ASH_VER_PATH="ash_rc.sh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anobash"

source "${ASH_PATH}/common/verify_paths.sh"

ash_init_settings "ash_bash_settings.sh" '### ---- AnoSH BASH User Settings ---- ###
alias edit=nvim
EDITOR=edit
VISUAL=edit

alias vi=edit
alias vim=edit
'

export ASH_PLUG_BLERC="$ASH_PATH_USER/blerc"

### ---- Initialize everything else ---- $
source "${ASH_PATH_COMMON}/init.sh"

#source "${ASH_PATH_ROOT}/ash_config.sh"
source "${ASH_PATH_ROOT}/ash_define.sh"
source "${ASH_PATH_ROOT}/ash_plugins.sh"

eval "$(starship init bash)"
eval "$(zoxide init bash)"

if [ -x "$(command -v blesh-share)" ]; then
  source "$(blesh-share)/ble.sh" --rcfile "${ASH_PATH_ROOT}/ash_config.sh"
fi
