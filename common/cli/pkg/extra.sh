_ash_pkg_extra_help() {
    echo "Usage:  ash pkg extra [OPTIONS] COMMAND"
    echo ""

    echo "Install AnoSH extras"
    echo ""

    echo "Commands:"
    echo "  install"
    echo "  list"
    echo "  update"
    echo "  help"
    echo ""

    echo "Options:"
    echo "  -h, --help    Runs ash pkg extra help"
    echo "  -u            Runs ash pkg extra update"
    echo ""
}

_ash_pkg_extra_install() {
    # $1 package name
    # $2 command to test instalation
    if [ "$1" == "anonv" ]; then
        if [[ ! -d "${HOME}/.config/nvim/lua/anonv" ]]; then
            bash <(curl -s https://raw.githubusercontent.com/Anonoei/anonv/main/install.sh)
        else
            echo "anonv is already installed"
        fi
    fi
}

_ash_pkg_extra_update() {
    if [[ -d "${HOME}/.config/nvim/lua/anonv" ]]; then
        old_path=$PWD
        cd "${HOME}/.config/nvim/lua/anonv"
        git reset --hard origin
        git pull origin main --force
        cd $old_path
    fi
}

_ash_pkg_extra() {
    if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        shift
        _ash_pkg_extra_help $*
    elif [[ "$1" == "update" ]] || [[ "$1" == "-u" ]]; then
        shift
        _ash_pkg_extra_update $*
    elif [[ "$1" == "list" ]] || [[ "$1" == "-l" ]]; then
        shift
        #_ash_pkg_extra_list $*
    elif [[ "$1" == "install" ]]; then
        shift
        _ash_pkg_extra_install $*
    else
        echo "Unknown ash pkg extra syntax: ash pkg extra $*"
        echo "Run 'ash pkg extra help' for more information"
    fi
}
