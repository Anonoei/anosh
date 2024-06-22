ASH_CLI_VERSION="0.0.1"

_ash_help() {
    echo '    ___               _____ __  __'
    echo '   /   |  ____  ____ / ___// / / /'
    echo '  / /| | / __ \/ __ \\__ \/ /_/ / '
    echo ' / ___ |/ / / / /_/ /__/ / __  /  '
    echo '/_/  |_/_/ /_/\____/____/_/ /_/   '
    echo "AnoSH '${ASH_REL}' v${ASH_VERSION}, cli v${ASH_CLI_VERSION}"
    echo ""

    echo "Commands:"
    echo "  vars"
    echo "  plugs"
    echo "  reinstall"
    echo "  update"
    echo "  help"
    echo ""

    echo "Options:"
    echo "  -h, --help    Runs ash help"
    echo "  -r            Runs ash reinstall"
    echo "  -u            Runs ash update"
    echo ""

    echo "Run 'ash COMMAND --help' for more information on a command"
}

source "${ASH_PATH_COMMON}/cli/base.sh"
source "${ASH_PATH_COMMON}/cli/status.sh"

_ash() {
    if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        shift
        _ash_help $*
    elif [[ "$1" == "vars" ]]; then
        shift
        _ash_vars $*
    elif [[ "$1" == "plugs" ]]; then
        shift
        _ash_plugs $*
    elif [[ "$1" == "reinstall" ]] || [[ "$1" == "-r" ]]; then
        shift
        _ash_reinstall $*
    elif [[ "$1" == "update" ]] || [[ "$1" == "-u" ]]; then
        shift
        _ash_update $*
    else
        echo "Unknown ash syntax: ash $*"
        _ash_help
    fi
}
alias ash="_ash"
