az_reinstall() {
    az_cmd 1 "bash <(curl -s "$ANOZSH_DL/install")"
}

az_update() {
    az_reinstall
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
az_pkgm=""
for item in "nala" "apt" "apk" "pacman" "dnf" "yum" "port" "zypper"; do
    cmd='{confirm_wrap --root $item "$@"}'
    declare $item="$cmd"
    if [ -x "$(command -v "$item")" ]; then
        az_pkgm=item;
    fi
done
