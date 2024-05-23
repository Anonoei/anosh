export ASH_PATH_COMMON="${ASH_PATH}/common"
export ASH_PATH_PLUGINS="${ASH_ROOT}/plugins"
export ASH_PATH_USER="${ASH_ROOT}/user"

export ASH_PLUG_BIN="${ASH_PATH_PLUGINS}/bin"
export ASH_PLUG_FASTFETCH="${ASH_PATH_PLUGINS}/fastfetch"

export ASH_PLUG_ROOT="${ASH_PATH_PLUGINS}/${ASH_REL}"
export ASH_PATH_ROOT="${ASH_PATH}/${ASH_REL}"

export STARSHIP_CONFIG="$ASH_PATH_USER/starship.toml"
export STARSHIP_CACHE="$ASH_PATH_PLUGINS/starship-cache"

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

PATH="${PATH}:$ASH_PLUG_BIN"
