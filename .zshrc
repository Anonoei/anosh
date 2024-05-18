######################################################
#      ___               ____  ______ _____  _____   #
#     / _ | ___  ___    /_  / / __/ // / _ \/ ___/   #
#    / __ |/ _ \/ _ \    / /__\ \/ _  / , _/ /__     #
#   /_/ |_/_//_/\___/   /___/___/_//_/_/|_|\___/     #
#                                                    #
######################################################
# Author: Anonoei (https://github.com/anonoei)
# License: MIT
ANOZSH_VERSION="0.5.2"
ANOZSH_URL="https://github.com/Anonoei/anozsh"
ANOZSH_DL="https://raw.githubusercontent.com/Anonoei/anozsh/main"
ANOZSH_SRC=""

## Dependencies
#   - curl
#   - [optional] exa (terminal icons)
#   - zsh-syntax-highlighting
#   - zsh-autosuggestions
#   - zinit (plugins)
#   - fzf (fuzzy finder)

az_install() {
    # $1 src, the file you want
    # $2 dst, where you want it

    src="$ANOZSH_SRC/$1"

    #echo "Installing $2 from $src"

    if [[ $ANOZSH_SRC == /* ]]; then
        cp "$src" "$2"
    else
        curl -L -o "$2" "$src"
        unset AZ_DL_URL
    fi
}

source "$HOME/.local/anozsh/az_main.zsh"
