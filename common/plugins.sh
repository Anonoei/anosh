# --- Starship --- #
if [ ! -f "$ASH_PLUG_BIN/starship" ] && ! command -v starship &> /dev/null; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -f "$ASH_PLUG_BIN/starship" ] || ! command -v starship &> /dev/null; then
    ASH_PLUGS+=("starship")
fi

# --- Zoxide --- #
if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && ! command -v zoxide &> /dev/null; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -f "$ASH_PLUG_BIN/zoxide" ] || ! command -v zoxide &> /dev/null; then
    ASH_PLUGS+=("zoxide")
fi

# --- Atuin --- #
if [ ! -f "$ASH_PLUG_BIN/atuin" ] && ! command -v atuin &> /dev/null; then
    echo "Installing atuin..."
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    mv "${HOME}/.atuin/bin/atuin" "$ASH_PLUG_BIN/atuin"
    mv "${HOME}/.atuin/bin/atuin-update" "$ASH_PLUG_BIN/atuin-update"
    rm -rf "${HOME}/.atuin"
fi
if [ -f "$ASH_PLUG_BIN/atuin" ] || ! command -v atuin &> /dev/null; then
    ASH_PLUGS+=("atuin")
fi

# --- Deps --- #
install_deps() {
    all_pkgs=(tree fzf trash-cli tldr btop fastfetch eza bat)
    all_cmds=(tree fzf trash tldr btop fastfetch eza bat)
    needed_pkgs=()
    i=0
    while [ $i -lt ${#all_pkgs[@]} ]; do
        if ! command -v "${all_cmds[$i]}" &> /dev/null; then
            needed_pkgs+=("${all_pkgs[$i]}")
        fi
        ((i++))
    done

    case $ASH_DISTRO in
		rhel)
			;;
		debian)
            if [[ ${needed_pkgs[@]} =~ "eza" ]]; then
                sudo mkdir -p /etc/apt/keyrings
                wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
                echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
                sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
                sudo apt update
            fi
			;;
		arch)
			;;
		*)
			echo "Unknown distro: $ASH_DISTRO"
			;;
	esac
    if [[ ${needed_pkgs[@]} ]]; then
        _ash_pkg_pkgm_install ${needed_pkgs[@]}
    fi
}
install_deps
