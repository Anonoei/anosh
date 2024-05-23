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

# Wrap these commands to ensure they're run with sudo
ash_sudo_wrap=("poweroff" "reboot" "hibernate" "nala" "apt" "apk" "pacman" "dnf" "yum" "zypper" "port")
for item in ${ash_sudo_wrap[@]}; do
    cmd='{confirm_wrap --root $item "$@"}'
    declare $item="$cmd"
done

# Create helper for installing packages
# Use $ash_pkgm install <package>
ash_pkg_managers=("nala" "apt" "apk" "pacman" "dnf" "yum" "port" "zypper" "brew")
ash_pkgm=""
for item in ${ash_pkg_managers}; do
    if [ -x "$(command -v $item)" ]; then
        ash_pkgm=$item;
    fi
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
