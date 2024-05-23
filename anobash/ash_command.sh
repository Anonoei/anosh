az_reinstall() {
    bash <(curl -s "${ASH_DOWN}/anobash/install") -r
}

az_update() {
    git_version=$(curl --silent "${ASH_DOWN}/anobash/.bashrc" | grep "ASH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ASH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ASH_VERSION\" / Found: $git_version"
        echo ""
        bash <(curl -s "${ASH_DOWN}/anobash/install")
    else
        echo "AnoSH BASH is up to date."
    fi
}
