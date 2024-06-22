if [ ! -f "$ASH_PLUG_BIN/starship" ] && [ ! -x "$(command -v starship)" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -x "$(command -v starship)" ]; then
    ASH_PLUGS+=("starship")
fi

if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && [ ! -x "$(command -v zoxide)" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi
if [ -x "$(command -v zoxide)" ]; then
    ASH_PLUGS+=("zoxide")
fi

install_deps() {
    _ash_pkg_nix_install "nixpkgs.tree" "tree"
    _ash_pkg_nix_install "nixpkgs.multitail" "multitail"
    _ash_pkg_nix_install "nixpkgs.fzf" "fzf"
    _ash_pkg_nix_install "nixpkgs.trash-cli" "trash"
    _ash_pkg_nix_install "nixpkgs.tldr" "tldr"
    _ash_pkg_nix_install "nixpkgs.btop" "btop"
    _ash_pkg_nix_install "nixpkgs.fastfetch" "fastfetch"
    _ash_pkg_nix_install "nixpkgs.eza" "eza"
    _ash_pkg_nix_install "nixpkgs.bat" "bat"
    _ash_pkg_nix_install "nixpkgs.atuin" "atuin"
}
if [ -x "$(command -v nix)" ]; then
    install_deps
fi
