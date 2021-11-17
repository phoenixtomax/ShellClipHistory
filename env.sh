#!/bin/env bash

BIN_DIR="$(pwd)";
export BIN_DIR;

function Z_selectEnv() {
printf "Tools Type:\n 1) Commands \n 2) Files \n Please select: \n";

unset -f `export -f | grep 'Z_.*()' | grep -v "Z_selectEnv" | awk '{print $1}'`;

read -r NUM;
if [[ "$NUM" == "1" ]]; then
	source "${BIN_DIR}/Commands/env.sh";
elif [[ "$NUM" == "2" ]]; then
	source "${BIN_DIR}/Files/env.sh";
else
	echo "No valid input."
fi

}

function Z_env() {
source ${BIN_DIR}/Commands/env.sh;
source ${BIN_DIR}/Files/env.sh;
}

function Z_clearEnv() {
unset -f Z_env;
}

unalias grep
alias grep='grep --color'

export -f Z_selectEnv
export -f Z_env
export -f Z_clearEnv

Z_env
echo "Env Commands: Z_selectEnv | Z_env is loaded !"
