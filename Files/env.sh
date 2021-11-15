#!/bin/env bash

function Z_swap {

if [ "$1" = "" ]; then
  echo "Help:  Z_swap <file_name> ";
elif [ -f "$1_bk" ]; then
  mv "$1" "$1"_temp
  mv "$1"_bk "$1"
  mv "$1"_temp "$1"_bk
  echo "mv $1 $1_temp";
  echo "mv $1_bk $1";
  echo "mv $1_temp $1_bk";
else
  cp "$1" "$1"_bk;
  echo "cp $1 $1_bk";
fi

}

# TODO: Check rsync existence or download it

function Z_emv {
  rsync -avh --remove-source-files --progress  "$1" "$2";
}

function Z_ecmv {
  rsync -avzh --remove-source-files --progress  "$1" "$2";
}

function Z_syncf {
  rsync -avh --progress  "$1" "$2";
}

function Z_synccf {
  rsync -avzh --progress  "$1" "$2";
}

function Z_remotesyncf {
  rsync -avh --progress -e ssh "$1" "$2"
}

function Z_remotesynccf {
  rsync -avzh --progress -e ssh "$1" "$2"
}

export -f Z_swap
export -f Z_emv
export -f Z_ecmv
export -f Z_syncf
export -f Z_syncff

echo "File Commands: Z_swap | Z_emv | Z_ecmv | Z_syncf | Z_synccf is loaded !"