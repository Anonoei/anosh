### ---- Paths ---- ###
PATH_LOCAL="${HOME}/.local"
PATH_ANOZSH="${HOME}/.local/anozsh"
PATH_ZSH="${PATH_ANOZSH}/.zsh"
PATH_ZINIT="${XDG_DATA_HOME:-${PATH_ANOZSH}}/.zinit"
PATH_PLUGINS="${PATH_ANOZSH}/plugins"
PATH_USER_ALIAS="${HOME}/.az_alias"

if [[ ! -d "${PATH_ZSH}" ]]; then
    mkdir -p "${PATH_ZSH}"
fi

### ---- Sources ---- ###
az_import() {
    # $1: local file name
    localpath="$PATH_LOCAL/$1"
    if [ -f "$localpath" ]; then
        source "$localpath"
    else
        echo "az.main.import: $1 not found. Downloading..."
        az_install "$1" "$localpath"
        source "$localpath"
    fi
}

if [ ! -f "$PATH_ANOZSH/az_settings.zsh" ]; then
    echo "### ---- Settings ---- ###" > "$PATH_ANOZSH/az_settings.zsh"
    echo "HISTLINES=10000" >> "$PATH_ANOZSH/az_settings.zsh"
    echo "alias edit=vi" >> "$PATH_ANOZSH/az_settings.zsh"
fi

source "$PATH_ANOZSH/az_settings.zsh"

az_import "anozsh/az_command.zsh"
az_import "anozsh/az_alias.zsh"

az_import "anozsh/az_config.zsh"
az_import "anozsh/az_colors.zsh"
az_import "anozsh/az_define.zsh"
az_import "anozsh/az_plugins.zsh"
az_import "anozsh/az_prompt.zsh"
