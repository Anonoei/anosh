### ---- Paths ---- ###
PATH_ANOZSH="${HOME}/.local/anozsh"
PATH_ZSH="${PATH_ANOZSH}/.zsh"
PATH_ZINIT="${XDG_DATA_HOME:-${PATH_ANOZSH}}/.zinit"
PATH_PLUGINS="${PATH_ANOZSH}/plugins"

### ---- Sources ---- ###
az_import() {
    # $1: local file path
    # $2: file name
    # $3: git path
    FILENAME=$2.zsh
    if [ -f "$1/$FILENAME" ]; then
        source "$1/$FILENAME"
    else
        print "404: $1/$FILENAME not found."
        az_install $FILENAME $3
        source "$1/$FILENAME"
    fi
}

az_new_import() {
    # $1: local file path
    # $2: file name
    # $3: git path
    AZ_IMPORTS+=("${1};${2};${3}")
}
declare -a AZ_IMPORTS=()

az_new_import $PATH_ANOZSH az_settings anozsh
az_new_import $PATH_ANOZSH az_command anozsh
az_new_import $PATH_ANOZSH az_alias anozsh
az_new_import $PATH_ANOZSH az_config anozsh
az_new_import $PATH_ANOZSH az_colors anozsh
az_new_import $PATH_ANOZSH az_define anozsh
az_new_import $PATH_ANOZSH az_plugins anozsh
az_new_import $PATH_ANOZSH az_prompt anozsh

# Import them
for row in $AZ_IMPORTS; do
    localPath=$(echo $row | cut -d ";" -f 1)
    file=$(echo $row | cut -d ";" -f 2)
    gitPath=$(echo $row | cut -d ";" -f 3)
    az_import "$localPath" "$file" "$gitPath"
done