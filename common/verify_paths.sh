export ASH_PATH_COMMON="${ASH_PATH}/common"
export ASH_PATH_PLUGINS="${ASH_ROOT}/plugins"
export ASH_PATH_USER="${ASH_ROOT}/user"

export ASH_DISTRO=$(bash ${ASH_ROOT}/src/common/scripts/distro)
export ASH_PKGMAN=$(bash ${ASH_ROOT}/src/common/scripts/pkgman)

export ASH_PLUG_BIN="${ASH_PATH_PLUGINS}/bin"
export ASH_PLUG_FASTFETCH="${ASH_PATH_PLUGINS}/fastfetch"
export ASH_PLUG_EZA="${ASH_PATH_PLUGINS}/eza"

export ASH_PLUG_ROOT="${ASH_PATH_PLUGINS}/${ASH_REL}"
export ASH_PATH_ROOT="${ASH_PATH}/${ASH_REL}"

export STARSHIP_CONFIG="$ASH_PATH_USER/starship.toml"
export STARSHIP_CACHE="$ASH_PATH_PLUGINS/starship-cache"

export ATUIN_CONFIG_DIR="$ASH_PATH_USER/atuin"
export ATUIN_CONFIG="$ATUIN_CONFIG_DIR/config.toml"

if [[ ! -d "${ASH_PATH_COMMON}" ]]; then
    mkdir -p "${ASH_PATH_COMMON}"
fi

if [[ ! -d "${ASH_PATH_PLUGINS}" ]]; then
    mkdir -p "${ASH_PATH_PLUGINS}"
fi

if [[ ! -d "${ASH_PATH_USER}" ]]; then
    mkdir -p "${ASH_PATH_USER}"
fi

if [[ ! -d "${ASH_PLUG_BIN}" ]]; then
    mkdir -p "${ASH_PLUG_BIN}"
fi

if [ ! -f "$STARSHIP_CONFIG" ]; then
    cp "${ASH_PATH}/plugins/starship.toml" "$STARSHIP_CONFIG"
fi

if [ ! -f "$ATUIN_CONFIG" ]; then
    mkdir -p $ATUIN_CONFIG_DIR
    cp "${ASH_PATH}/plugins/atuin.toml" "$ATUIN_CONFIG"
    if [ -f "$HOME/.config/atuin/config.toml" ]; then
        rm "$HOME/.config/atuin/config.toml"
    fi
    ln -s "${ASH_PATH}/plugins/atuin.toml" "$HOME/.config/atuin/config.toml"
fi

PATH="${PATH}:$ASH_PLUG_BIN"
