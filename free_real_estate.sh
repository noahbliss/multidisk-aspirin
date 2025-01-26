#!/usr/bin/env bash
T_ROOT="/mnt/disk/user"
INPUT_FILE="/mnt/disk/user/linklist"
count=0
while IFS= read -r line; do
  ((count++))
  if [ -L "$line" ] && [ -e "$line" ]; then
    echo "GOOD: $line"
  elif [ -L "$line" ] && [ ! -e "$line" ]; then
    echo "BROKEN: $line"
  else
    echo "DELETED: $line"
    echo "REMOVING FILES..."
    R_TARGET=$(echo $line | sed "s|$HOME/||")
    rm -rf "$T_ROOT/$R_TARGET"
    sed -i "${count}d" $INPUT_FILE
  fi
done < "$INPUT_FILE"
