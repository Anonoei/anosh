az_reinstall() {
    bash <(curl -s "${ANOZSH_DL}install") -c
}

az_update() {
    git_version=$(curl --silent "https://raw.githubusercontent.com/Anonoei/anozsh/main/.zshrc" | grep "ANOZSH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ANOZSH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ANOZSH_VERSION\" / Found: $git_version"
        echo ""
        bash <(curl -s "${ANOZSH_DL}install")
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
# Create sudo wrappers for package managers
for item in "nala" "apt" "apk" "pacman" "dnf" "yum" "port" "zypper"; do
    cmd='{confirm_wrap --root $item "$@"}'
    declare $item="$cmd"
done
# Create helper for installing packages
az_pkgm=""
for item in "nala" "apk" "apk" "pacman" "dnf" "yum" "port" "zypper" "brew"; do
    if [ -x "$(command -v $item)" ]; then
        az_pkgm=$item;
    fi
done

cd ()
{
	if [ -n "$1" ]; then
		builtin cd "$@" && ls
	else
		builtin cd ~ && ls
	fi
}

# IP address lookup
alias whatismyip="whatsmyip"
function whatsmyip ()
{
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
