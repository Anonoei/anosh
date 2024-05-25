if [ ! -f "$ASH_PLUG_BIN/starship" ] && [ ! -x "$(command -v starship)" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && [ ! -x "$(command -v zoxide)" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

install_nix_pkg() {
    # $1 package name
    # $2 command to test instalation
    if [[ "$(which $2)" == *"not found" ]] || [ -z "$(which $2)" ]; then
        nix-env -iA $1
    fi
}

install_deps() {
    install_nix_pkg "nixpkgs.tree" "tree"
    install_nix_pkg "nixpkgs.multitail" "multitail"
    install_nix_pkg "nixpkgs.fzf" "fzf"
    install_nix_pkg "nixpkgs.trash-cli" "trash"
    install_nix_pkg "nixpkgs.tldr" "tldr"
    install_nix_pkg "nixpkgs.btop" "btop"
    install_nix_pkg "nixpkgs.fastfetch" "fastfetch"
    install_nix_pkg "nixpkgs.eza" "eza"
    install_nix_pkg "nixpkgs.bat" "bat"
}
if [ -x "$(command -v nix)" ]; then
    install_deps
fi
