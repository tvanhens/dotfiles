#!/bin/bash

set -e

function log {
    echo "[`date`] $1"
}

log "Cleaning up Downloads directory"

rm -fr /Users/tvanhens/Downloads/**

log "Downloads successfully cleaned"
