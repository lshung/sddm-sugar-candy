#!/bin/bash

set -e

main() {
    declare_variables
    run_test
}

declare_variables() {
    SDDM_THEME_NAME="sugar-candy"
    SDDM_THEMES_DIR="/usr/share/sddm/themes"
    SDDM_THEME_DIR="$SDDM_THEMES_DIR/$SDDM_THEME_NAME"
}

run_test() {
    sddm-greeter --test-mode --theme "$SDDM_THEME_DIR"
}

main
