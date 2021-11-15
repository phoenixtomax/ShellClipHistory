#!/bin/env bash

function Z_show { cat -n "${BIN_DIR}"/Commands/entries.sh; }
function Z_do { sed -n "${1}p" "${BIN_DIR}"/Commands/entries.sh; eval `sed -n "${1}p" ${BIN_DIR}/Commands/entries.sh`; }
function Z_store { echo "$1" >> "${BIN_DIR}"/Commands/entries.sh; }
function Z_clean { echo "" > "${BIN_DIR}"/Commands/entries.sh; }

export -f Z_show
export -f Z_do
export -f Z_store
export -f Z_clean

echo "Commands: Z_show | Z_do | Z_store | Z_clean is loaded !"