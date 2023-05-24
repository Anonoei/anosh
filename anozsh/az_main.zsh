### ---- Paths ---- ###
PATH_ANOZSH="${HOME}/.local/anozsh"
PATH_ZSH="${PATH_ANOZSH}/.zsh"
PATH_ZINIT="${XDG_DATA_HOME:-${PATH_ANOZSH}}/.zinit"
PATH_PLUGINS="${PATH_ANOZSH}/plugins"

### ---- Sources ---- ###
az_source() {
    # $1: local file path
    # $2: file name
    # $3: git path
    FILENAME=$2.zsh
    if [ -f "$1/$FILENAME" ]; then
        source "$1/$FILENAME"
    else
        print "404: $1/$FILENAME not found."
        az_install $FILENAME $3
        az_source $1 $2 $3
    fi
}

az_source $PATH_ANOZSH az_settings anozsh
az_source $PATH_ANOZSH az_alias anozsh
az_source $PATH_ANOZSH az_config anozsh
az_source $PATH_ANOZSH az_colors anozsh
az_source $PATH_ANOZSH az_define anozsh
az_source $PATH_ANOZSH az_plugins anozsh
az_source $PATH_ANOZSH az_prompt anozsh