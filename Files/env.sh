#!/bin/env bash

function Z_rename {

echo $# $@
if [ $# -lt 3 ]; then
  echo "Help: Z_rename new_name new_start_suffix_number target_name";
else
  count=0
  newname=""
  for i in "$@"; do
    if [ "${count}" = "0" ]; then
      newname=${i};
    elif [ "${count}" = "1" ]; then
      count=${i};
      continue
    else
      mv ${i} ${newname%.*}_${count}.${i##*.};
    fi
    ((count++));
  done
fi

}

function Z_swap {

if [ "$1" = "" ]; then
  echo "Help:  Z_swap <file_name> ";
elif [ -f "$1_bk" ]; then
  mv "$1" "$1"_temp
  mv "$1"_bk "$1"
  mv "$1"_temp "$1"_bk

  echo "$1 <=> $1_bk"
  echo "mv $1 $1_temp";
  echo "mv $1_bk $1";
  echo "mv $1_temp $1_bk";
else
  cp "$1" "$1"_bk;
  echo "$1 => $1_bk"
  echo "cp $1 $1_bk";
fi

}

# TODO: Check rsync existence or download it

function Z_emv {
  echo "Emv $3 $1 $2"
  rsync -avh "$3" --remove-source-files --progress  "$1" "$2";
}

function Z_ecmv {
  echo "Compressed Emv $3 $1 $2"
  rsync -avzh "$3" --remove-source-files --progress  "$1" "$2";
}

function Z_syncf {
  echo "SynFile $3 $1 $2"
  rsync -avh "$3" --progress  "$1" "$2";
}

function Z_synccf {
  echo "Compressed SynFile $3 $1 $2"
  rsync -avzh "$3" --progress  "$1" "$2";
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
