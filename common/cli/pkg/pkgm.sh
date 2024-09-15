_ash_pkg_pkgm_install() {
    case $ASH_PKGMAN in
		yum|dnf)
			sudo $ASH_PKGMAN install $*
			;;
		apt)
            sudo $ASH_PKGMAN install $*
			;;
		pacman)
			sudo $ASH_PKGMAN -Syu $*
			;;
		*)
			echo "Unknown package manager: $ASH_PKGMAN"
			;;
	esac
}

_ash_pkg_pkgm_remove() {
    case $ASH_PKGMAN in
		yum|dnf)
			sudo $ASH_PKGMAN remove $*
			;;
		apt)
            sudo $ASH_PKGMAN remove $*
			;;
		pacman)
			sudo $ASH_PKGMAN -Rs $*
			;;
		*)
			echo "Unknown package manager: $ASH_PKGMAN"
			;;
	esac
}

_ash_pkg_pkgm_update() {
    case $ASH_PKGMAN in
		yum|dnf)
			sudo $ASH_PKGMAN update
			;;
		apt)
            sudo $ASH_PKGMAN update
			;;
		pacman)
			sudo $ASH_PKGMAN -Sy
			;;
		*)
			echo "Unknown package manager: $ASH_PKGMAN"
			;;
	esac
}
