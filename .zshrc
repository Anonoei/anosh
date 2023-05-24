######################################################
#      ___               ____  ______ _____  _____   #
#     / _ | ___  ___    /_  / / __/ // / _ \/ ___/   #
#    / __ |/ _ \/ _ \    / /__\ \/ _  / , _/ /__     #
#   /_/ |_/_//_/\___/   /___/___/_//_/_/|_|\___/     #
#                                                    #
######################################################
# Author: Anonoei (https://github.com/anonoei)
# License: MIT
ANOZSH_VERSION="0.4.0"
ANOZSH_GIT_AUTHOR="Anonoei"
ANOZSH_GIT_REPO="anozsh"
ANOZSH_GIT_BRANCH="main"
ANOZSH_URL_DOWN="https://raw.githubusercontent.com"
ANOZSH_URL="https://github.com/${ANOZSH_GIT_AUTHOR}/${ANOZSH_GIT_REPO}"

## Dependencies
#   - curl
#   - [optional] exa (terminal icons)
#   - zsh-syntax-highlighting
#   - zsh-autosuggestions
#   - zinit (plugins)
#   - fzf (fuzzy finder)

az_install() {
    # $1 filename
    # $2 filepath
    AZ_DL_FILE=""
    if [ ! -z "$2" -a "$2" != " " ]; then
        AZ_DL_FILE="$2/$1"
    else
        AZ_DL_FILE="$1"
    fi
    AZ_DL_URL=$ANOZSH_URL_DOWN/$ANOZSH_GIT_AUTHOR/$ANOZSH_GIT_REPO/$ANOZSH_GIT_BRANCH/$AZ_DL_FILE
    echo "Downloading $AZ_DL_URL"
    curl -L -o "${HOME}/.local/$AZ_DL_FILE" $AZ_DL_URL
    unset AZ_DL_FILE
    unset AZ_DL_URL
}

source ~/.local/anozsh/az_main.zsh