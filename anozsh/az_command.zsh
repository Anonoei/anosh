az_reinstall() {
    bash <(curl -s https://raw.githubusercontent.com/Anonoei/anozsh/main/install)
}

az_update() {
    rm -r "$PATH_ANOZSH/az_*.zsh"
    echo $AZ_IMPORTS
    for row in $AZ_IMPORTS; do
        localPath=$(echo $row | cut -d ";" -f 1)
        file=$(echo $row | cut -d ";" -f 2)
        gitPath=$(echo $row | cut -d ";" -f 3)
        az_import "$localPath" "$file" "$gitPath"
    done
    az_install "az_main.zsh" anozsh
    az_update_rc="$ANOZSH_URL_DOWN/$ANOZSH_GIT_AUTHOR/$ANOZSH_GIT_REPO/$ANOZSH_GIT_BRANCH/.zshrc"
    echo "Downloading $az_update_rc"
    curl -L -o "${HOME}/.zshrc" $az_update_rc
    exec zsh
}

### ---- Confirm commands ---- ###
confirm() {
    local response="y"
    echo -ne "Do you want to run '$*' (y/N)? "
    read -q response
    echo
    case "$response" in
        [yY][eE][sS]|[yY]) command "${@}";;
        *) return false;;
    esac
}
confirm_wrap() {
    if [ "$1" = '--root' ]; then
        local as_root='1'
        shift
    fi
    local prefix=''
    if [ "${as_root}" = '1' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi

    confirm ${prefix} "$@"
}

poweroff() { confirm_wrap --root $0 "$@"; }
reboot() { confirm_wrap --root $0 "$@"; }
hibernate() { confirm_wrap --root $0 "$@"; }
# Package managers
pacman() { confirm_wrap --root $0 "$@"; }
apt() { confirm_wrap --root $0 "$@"; }
nala() { confirm_wrap --root $0 "$@"; }
port() { confirm_wrap --root $0 "$@"; }