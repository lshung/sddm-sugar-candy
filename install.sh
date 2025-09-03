#!/bin/bash

set -e

main() {
    declare_variables
    prepare_theme_dir
    copy_theme_files
    set_current_theme
}

declare_variables() {
    SCRIPT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd)"
    SDDM_THEME_NAME="sugar-candy"
    SDDM_THEMES_DIR="/usr/share/sddm/themes"
    SDDM_THEME_DIR="$SDDM_THEMES_DIR/$SDDM_THEME_NAME"
    SDDM_CONFIG_DIR="/usr/lib/sddm/sddm.conf.d"
    SDDM_CONFIG_FILE="$SDDM_CONFIG_DIR/$SDDM_THEME_NAME.conf"
}

prepare_theme_dir() {
    sudo mkdir -p "$SDDM_THEME_DIR"
    sudo rm -rf "$SDDM_THEME_DIR"/{*,.*}
}

copy_theme_files() {
    sudo cp -r "$SCRIPT_DIR"/* "$SDDM_THEME_DIR"/
}

set_current_theme() {
    echo "[Theme]" | sudo tee "$SDDM_CONFIG_FILE" >/dev/null
    echo "Current=$SDDM_THEME_NAME" | sudo tee -a "$SDDM_CONFIG_FILE" >/dev/null
}

main
