ash_reinstall() {
    zsh <(curl -s "${ASH_DOWN}/anozsh/install") -r
}

ash_update() {
    git_version=$(curl --silent "${ASH_DOWN}/anozsh/.zshrc" | grep "ASH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ASH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ASH_VERSION\" / Found: $git_version"
        echo ""
        zsh <(curl -s "${ASH_DOWN}/anozsh/install")
    else
        echo "AnoSH ZSH is up to date."
    fi
}
