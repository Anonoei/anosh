if [ ! -f "$ASH_PLUG_BIN/starship" ] && [ ! -x "$(command -v starship)" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && [ ! -x "$(command -v zoxide)" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

install_deps() {
    if [[ "$(which tree)" == *"not found" ]]; then
        nix-env -iA nixpkgs.tree
    fi
    if [[ "$(which multitail)" == *"not found" ]]; then
        nix-env -iA nixpkgs.multitail
    fi
    if [[ "$(which fzf)" == *"not found" ]]; then
        nix-env -iA nixpkgs.fzf
    fi
    if [[ "$(which trash)" == *"not found" ]]; then
        nix-env -iA nixpkgs.trash-cli
    fi
    if [[ "$(which tldr)" == *"not found" ]]; then
        nix-env -iA nixpkgs.tldr
    fi
    if [[ "$(which btop)" == *"not found" ]]; then
        nix-env -iA nixpkgs.btop
    fi
    if [[ "$(which fastfetch)" == *"not found" ]]; then
        nix-env -iA nixpkgs.fastfetch
    fi
    if [[ "$(which eza)" == *"not found" ]]; then
        nix-env -iA nixpkgs.eza
    fi
    if [[ "$(which bat)" == *"not found" ]]; then
        nix-env -iA nixpkgs.bat
    fi
}
if [ -x "$(command -v nix)" ]; then
    install_deps
fi
