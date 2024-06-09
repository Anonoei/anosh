#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_VERSION="0.7.2"
ASH_VER_PATH="ash_rc.zsh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anozsh"

source "${ASH_PATH}/common/verify_paths.sh"

ash_init_settings "ash_zsh_settings.zsh" '### ---- AnoSH ZSH User Settings ---- ###
alias edit=nvim
EDITOR=edit
VISUAL=edit

alias vi=edit
alias vim=edit
'

### ---- Initialize everything else ---- $
source "${ASH_PATH_COMMON}/init.sh"

source "${ASH_PATH_ROOT}/ash_config.zsh"
source "${ASH_PATH_ROOT}/ash_define.zsh"
source "${ASH_PATH_ROOT}/ash_plugins.zsh"

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"
