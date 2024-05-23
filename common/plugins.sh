if [ ! -f "$ASH_PLUG_BIN/starship" ] && [ ! -x "$(command -v starship)" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

if [ ! -f "$ASH_PLUG_BIN/zoxide" ] && [ ! -x "$(command -v zoxide)" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

# If cmake is installed, install things that require cmake
if [ -x "$(command -v cmake)" ]; then
    if [ ! -f "$ASH_PLUG_BIN/fastfetch" ] && [ ! -x "$(command -v fastfetch)" ]; then
        git clone https://github.com/fastfetch-cli/fastfetch.git $ASH_PLUG_FASTFETCH
        old_path=$PWD
        cd $ASH_PLUG_FASTFETCH
        mkdir -p build
        cd build
        echo "Compiling fastfetch..."
        cmake ..
        cmake --build . --target fastfetch --target flashfetch
        mv "$ASH_PLUG_FASTFETCH/build/fastfetch" "$ASH_PLUG_BIN/fastfetch"
        mv "$ASH_PLUG_FASTFETCH/build/flashfetch" "$ASH_PLUG_BIN/flashfetch"
        cd ..
        rm -rf build
        cd $old_path
    fi
fi

# If cargo is installed, install things that require cargo
if [ -x "$(command -v cargo)" ]; then
    if [ ! -f "$ASH_PLUG_BIN/eza" ] || [ ! -x "$(command -v eza)" ]; then
        git clone https://github.com/eza-community/eza.git $ASH_PLUG_EZA
        old_path=$PWD
        cd $ASH_PLUG_EZA
        cargo install --path .
        mv "$HOME/.cargo/bin/eza" "$ASH_PLUG_BIN/eza"
        cd $old_path
    fi
    if [ ! -f "$ASH_PLUG_BIN/bat" ] || [ ! -x "$(command -v bat)" ] || [ ! -x "$(command -v batcat)" ]; then
        git clone https://github.com/sharkdp/bat.git $ASH_PLUG_BAT
        old_path=$PWD
        cd $ASH_PLUG_BAT
        cargo install --locked bat
        mv "$HOME/.cargo/bin/bat" "$ASH_PLUG_BIN/bat"
        cd $old_path
    fi
fi
