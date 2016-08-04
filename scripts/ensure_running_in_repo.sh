#!/bin/bash

echo '[setup] Making sure we are running inside a git repository.'
if git rev-parse --is-inside-work-tree; then
    echo '[setup] Looks good!'
else
    echo "[setup] We don't seem to be inside a git repository."
    echo '[setup] Cloning raxod502/dotfiles.'
    git clone https://github.com/raxod502/dotfiles.git
    repo_path_regex='dotfiles-([^/]+)/scripts'
    if [[ $(pwd) =~ $repo_path_regex ]]; then
        branch_name="${BASH_REMATCH[1]}"
        if [[ $branch_name != master ]]; then
            echo "[setup] It looks like you downloaded a version of this script from the '$branch_name' branch."
            echo "[setup] Attempting to switch to the '$branch_name' branch."
            cd dotfiles
            git checkout "$branch_name" || true
            cd ..
        fi
    fi
    echo '[setup] Starting again using the cloned script.'
    source dotfiles/scripts/setup.sh
    exit 0
fi
