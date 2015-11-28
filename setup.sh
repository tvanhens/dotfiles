#!/usr/bin/env bash

scriptPath="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "${scriptPath}/tmux.conf" "$HOME/.tmux.conf"
