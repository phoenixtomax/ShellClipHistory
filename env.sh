#!/bin/env bash

export BIN_DIR=`pwd` 

function Z_select_env {

echo " \
Tools Type:\n \
    1) Commands\n\
    2) Files \n\
    Please select: \n";

unset -f "Z_*";
read -t 0 -p 1 NUM;
if [ "$NUM" == "1" ]; then
	source ${BIN_DIR}/Commands/env.sh
elif [ "$NUM" == "2" ]; then
	source ${BIN_DIR}/Files/env.sh
else
	echo "No valid input."
fi

}

function Z_env {
source ${BIN_DIR}/Commands/env.sh;
source ${BIN_DIR}/Files/env.sh;
}

function Z_clearEnv {
unset -f Z_env;
}

alias grep='grep --color'
export -f Z_select_env
export -f Z_env
export -f Z_clearEnv

Z_env
echo "Env Commands: Z_select_env | Z_env is loaded !"
