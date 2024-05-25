ash_reinstall() {
    $SHELL <(curl -s "${ASH_DOWN}/${ASH_REL}/install")
}

ash_update() {
    git_version=$(curl --silent "${ASH_DOWN}/${ASH_REL}/${ASH_VER_PATH}" | grep "ASH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ASH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ASH_VERSION\" / Found: $git_version"
        echo ""
        old_path=$PWD
        cd $ASH_PATH
        git pull --rebase
        cd $old_path
    else
        echo "AnoSH is up to date."
    fi
}

install_nix() {
    distro=$(bash ${ASH_ROOT}/src/common/scripts/distro)
    if [ ! -x "$(command -v nix)" ]; then
        echo -ne "Install Nix package manager? (Y/n)"
        read -q response
        if [[ "$response" == n* ]]; then
            echo "Not installing Nix..."
        else
            if [ $distro == "MacOS" ]; then
                sh <(curl -L https://nixos.org/nix/install)
            else
                sh <(curl -L https://nixos.org/nix/install) --daemon
            fi
        fi
    fi
}
install_nix

confirm() {
    local response="y"
    echo -ne "Do you want to run '$*' (y/N)? "
    if [[ $SHELL = *zsh* ]]; then
        read -q response
    else
        read -N 1
    echo
    case "$response" in
        [yY][eE][sS]|[yY]) command "${@}";;
        *) return false;;
    esac
}
confirm_wrap() {
    if [ "$1" == '--root' ]; then
        local as_root='1'
        shift
    fi
    local prefix=''
    if [ "${as_root}" = '1' ] && [ "${USER}" != 'root' ]; then
        prefix="sudo"
    fi

    confirm ${prefix} "$@"
}

# Wrap these commands to ensure they're run with sudo
ash_sudo_wrap=("poweroff" "reboot" "hibernate" "nala" "apt" "apk" "pacman" "dnf" "yum" "zypper" "port")
for item in ${ash_sudo_wrap[@]}; do
    cmd='{confirm_wrap --root $item "$@"}'
    declare $item="$cmd"
done

cd() {
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

whatsmyip() {
	# Internal IP Lookup.
	if [ -e /sbin/ip ]; then
		echo -n "Internal IP: "
		/sbin/ip addr show wlan0 | grep "inet " | awk -F: '{print $1}' | awk '{print $2}'
	else
		echo -n "Internal IP: "
		/sbin/ifconfig wlan0 | grep "inet " | awk -F: '{print $1} |' | awk '{print $2}'
	fi

	# External IP Lookup
	echo -n "External IP: "
	curl -s ifconfig.me
}
