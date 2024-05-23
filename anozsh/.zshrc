#          ___               _____ __  __
#         /   |  ____  ____ / ___// / / /
#        / /| | / __ \/ __ \\__ \/ /_/ /
#       / ___ |/ / / / /_/ /__/ / __  /
#      /_/  |_/_/ /_/\____/____/_/ /_/
# Author: Anonoei (https://github.com/anonoei)
# Source: https://github.com/anonoei/anosh
# License: MIT
ASH_HOME="https://github.com/anonoei/anosh"
ASH_DOWN="https://raw.githubusercontent.com/anonoei/anosh/main"
ASH_VERSION="0.6.0"
ASH_SRC=""

## Dependencies
#   - curl
#   - [optional] exa (terminal icons)
#   - zsh-syntax-highlighting
#   - zsh-autosuggestions
#   - zinit (plugins)
#   - fzf (fuzzy finder)

### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
ASH_PATH="${PATH_LOCAL}/anosh"

ASH_COMMON="${ASH_PATH}/common"

ASH_PATH_PLUGINS="${ASH_PATH}/plugins"
ASH_PLUG_BIN="${ASH_PATH_PLUGINS}/bin"
ASH_PLUG_ZSH="${ASH_PATH_PLUGINS}/zsh"

ASH_PATH_ROOT="${ASH_PATH}/anozsh"

PATH="${PATH}:$ASH_PLUG_BIN"

export STARSHIP_CONFIG="$ASH_PATH/starship.toml"
export STARSHIP_CACHE="$ASH_PATH_PLUGINS/starship-cache"

if [[ ! -d "${PATH_LOCAL}" ]]; then
    mkdir -p "${PATH_LOCAL}"
fi
if [[ ! -d "${ASH_PATH}" ]]; then
    mkdir -p "${ASH_PATH}"
fi
if [[ ! -d "${ASH_PATH_PLUGINS}" ]]; then
    mkdir -p "${ASH_PATH_PLUGINS}"
fi
if [[ ! -d "${ASH_PLUG_BIN}" ]]; then
    mkdir -p "${ASH_PLUG_BIN}"
fi
if [[ ! -d "${ASH_PATH_ROOT}" ]]; then
    mkdir -p "${ASH_PATH_ROOT}"
fi

### ---- Sources ---- ###
ash_install() {
    # $1 src, the file you want
    # $2 dst, where you want it

    #echo "Installing $2 from $ASH_SRC/$1"

    dst_dir="$(dirname $2)"
    if [[ ! -z "$dst_dir" && ! -d "${dst_dir}" ]]; then
        mkdir -p "${dst_dir}"
    fi

    if [[ $ASH_SRC == /* ]]; then
        cp "$ASH_SRC/$1" "$2"
    else
        curl -L -o "$2" "${ASH_SRC}/$1"
    fi
}
ash_import() {
    # $1: local file name

    local import_path="$ASH_PATH/$1"
    #echo "Importing $import_path"
    if [ -f "$import_path" ]; then
        source "$import_path"
    else
        echo "ash.ash_import: $1 not found. Downloading..."
        ash_install "$1" "$import_path"
        #echo "Sourcing $import_path"
        source "$import_path"
    fi
}

if [ ! -f "$ASH_PATH_ROOT/ash_settings.zsh" ]; then
    local settings_defalt='
### ---- Settings ---- ###
export HISTLINES=10000
export HISTCONTROL=erasedups:ignoredups:ignorespace
alias edit=vi'
    echo $settings_default > "$ASH_PATH_ROOT/ash_settings.zsh"
fi

source "$ASH_PATH_ROOT/ash_settings.zsh"

ash_import "common/colors.sh"
ash_import "common/plugins.sh"
ash_import "common/alias.sh"

ash_import "anozsh/ash_command.zsh"
ash_import "anozsh/ash_config.zsh"
ash_import "anozsh/ash_define.zsh"
ash_import "anozsh/ash_plugins.zsh"

if [ ! -f "$STARSHIP_CONFIG" ]; then
    ash_install "plugins/starship.toml" "$STARSHIP_CONFIG"
fi

source <(fzf --zsh)
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
