confirm() {
    local response="y"
    echo -ne "Do you want to run '$*' (y/N)? "
    if [[ $SHELL = *zsh* ]]; then
        read -q response
    else
        read -N 1
    fi
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
