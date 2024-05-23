if [ ! -f "$ASH_PLUG_BIN/starship" ]; then
    echo "Installing starship..."
    sh <(curl -sS "https://starship.rs/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

if [ ! -f "$ASH_PLUG_BIN/zoxide" ]; then
    echo "Installing zoxide..."
    bash <(curl -sSfL "https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh") --bin-dir "$ASH_PLUG_BIN"
fi

if [ ! -f "$ASH_PLUG_BIN/fastfetch" ]; then
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
