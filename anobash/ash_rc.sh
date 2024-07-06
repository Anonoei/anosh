#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
cd ..ASH_VERSION="0.8.1"
ASH_VER_PATH="ash_rc.sh"

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_ROOT="${PATH_LOCAL}/anosh"
ASH_PATH="${ASH_ROOT}/src"
ASH_REL="anobash"
ASH_SHELL="bash"

source "${ASH_PATH}/common/verify_paths.sh"

ash_init_settings ".ash_bashrc" '### ---- AnoSH BASH User Settings ---- ###
EDITOR=nvim
VISUAL=nvim

alias vi=EDITOR
'

### ---- Initialize anosh ---- ###
source "${ASH_PATH_COMMON}/init.sh"
