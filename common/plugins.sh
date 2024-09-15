# --- Starship --- #
if [ ! -f "$ASH_PLUG_BIN/starship" ] && [ ! -x "$(command -v starship)" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -f "$ASH_PLUG_BIN/starship" ] || [ -x "$(command -v starship)" ]; then
    ASH_PLUGS+=("starship")
fi

# --- Zoxide --- #
if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && [ ! -x "$(command -v zoxide)" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -f "$ASH_PLUG_BIN/zoxide" ] || [ -x "$(command -v zoxide)" ]; then
    ASH_PLUGS+=("zoxide")
fi

# --- Atuin --- #
if [ ! -f "$ASH_PLUG_BIN/atuin" ] && [ ! -x "$(command -v atuin)" ]; then
    echo "Installing atuin..."
    curl --proto '=https' --tlsv1.2 -LsSf https://setup.atuin.sh | sh
    mv "${HOME}/.atuin/bin/atuin" "$ASH_PLUG_BIN/atuin"
    mv "${HOME}/.atuin/bin/atuin-update" "$ASH_PLUG_BIN/atuin-update"
    rm -rf "${HOME}/.atuin"
fi
if [ -f "$ASH_PLUG_BIN/atuin" ] || [ -x "$(command -v atuin)" ]; then
    ASH_PLUGS+=("atuin")
fi

# --- Deps --- #
install_deps() {
    packages=()
    case $ASH_DISTRO in
		rhel)
			packages=(tree fzf trash-cli tldr btop fastfetch eza bat)
			;;
		debian)
            sudo mkdir -p /etc/apt/keyrings
            wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
            echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
            sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
            sudo apt update
			packages=(tree fzf trash-cli tldr btop fastfetch eza bat)
			;;
		arch)
			packages=(tree fzf trash-cli tldr btop fastfetch eza bat)
			;;
		*)
			echo "Unknown distro: $ASH_DISTRO"
			;;
	esac
    _ash_pkg_pkgm_install ${packages[@]}
}
install_deps
