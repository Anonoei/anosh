### ---- Install QoL features ---- ###
# Use bash-completion, if available
if [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi
install_nix_pkg "nixpkgs.blesh" "blesh-share"
