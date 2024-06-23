_ash_pkg_nix_update() {
    sudo nix-channel --update
    sudo nixos-rebuild switch
    nix-env -u ‘*’
}

_ash_pkg_nix_install() {
    # $1 package name
    # $2 command to test instalation
    if [[ ! ${ASH_PLUGS[@]} =~ $2 ]]; then
        if  [[ "$(which $2)" == *"not found" ]] || [ -z "$(which $2)" ]; then
            nix-env -iA $1
        fi
        ASH_PLUGS+=("$2")
    fi
}

_ash_pkg_nix() {
    if [[ "$1" == "help" ]] || [[ "$1" == "-h" ]] || [[ "$1" == "--help" ]]; then
        shift
        _ash_pkg_nix_help $*
    elif [[ "$1" == "update" ]] || [[ "$1" == "-u" ]]; then
        shift
        _ash_pkg_nix_update $*
    else
        echo "Unknown ash pkg nix syntax: ash pkg nix $*"
        echo "Run 'ash pkg nix help' for more information"
    fi
}
