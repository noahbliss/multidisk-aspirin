#!/usr/bin/env bash

T_ROOT=/mnt/disk/user
LINK_LIST=linklist

TARGET=$(realpath $1)

if ! [[ "$TARGET" =~ ^"$HOME" ]]; then
  echo "Can only migrate directories below $HOME"
  exit 1
fi

if [ -d "$TARGET" ]; then
  # continue
  cd $T_ROOT
  R_TARGET=$(echo $TARGET | sed "s|$HOME/||")
  mkdir -p $(dirname $R_TARGET)
  mv "$TARGET" "$R_TARGET"
  ln -s "$T_ROOT/$R_TARGET" "$TARGET"
  echo "$TARGET" >> "$T_ROOT/$LINK_LIST"
else
  echo "Not a directory."
fi
