_ash_reinstall() {
    $SHELL <(curl -s "${ASH_DOWN}/${ASH_REL}/install")
}

_ash_update() {
    git_version=$(curl --silent "${ASH_DOWN}/${ASH_REL}/${ASH_VER_PATH}" | grep "ASH_VERSION")
    git_version=${git_version#*=}

    if [ "$git_version" != "\"$ASH_VERSION\"" ]; then
        echo "Your version is out of date!"
        echo "Installed: \"$ASH_VERSION\" / Found: $git_version"
        echo ""
        old_path=$PWD
        cd $ASH_PATH
        git pull --rebase --force
        cd $old_path
    else
        echo "AnoSH is up to date."
    fi
}
