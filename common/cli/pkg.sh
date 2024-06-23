_ash_pkg_help() {
    echo "Usage:  ash pkg [OPTIONS] COMMAND"
    echo ""

    echo "Manage AnoSH installation"
    echo ""

    echo "Commands:"
    echo "  update"
    echo "  nix"
    echo "  help"
    echo ""

    echo "Options:"
    echo "  -h, --help    Runs ash pkg help"
    echo "  -u            Runs ash pkg update"
    echo "  -n            Runs ash pkg nix"
    echo ""
}

source "${ASH_PATH_COMMON}/cli/pkg/nix.sh"

source "${ASH_PATH_COMMON}/cli/pkg/update.sh"


_ash_pkg() {
    if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        shift
        _ash_pkg_help $*
    elif [[ "$1" == "update" ]] || [[ "$1" == "-u" ]]; then
        shift
        _ash_pkg_update $*
    elif [[ "$1" == "nix" ]]; then
        shift
        _ash_pkg_nix $*
    else
        echo "Unknown ash pkg syntax: ash pkg $*"
        echo "Run 'ash pkg help' for more information"
    fi
}
