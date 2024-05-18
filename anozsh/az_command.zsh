az_reinstall() {
    bash <(curl -s "$ANOZSH_DL/install") -c
}

az_update() {
    git_version=$(curl --silent "https://raw.githubusercontent.com/Anonoei/anozsh/main/.zshrc" | grep "ANOZSH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ANOZSH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ANOZSH_VERSION\" / Found: $git_version"
        echo ""
        bash <(curl -s "$ANOZSH_DL/install")
    else
        echo "AnoZSH is up to date."
    fi
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
