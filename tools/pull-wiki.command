#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../
cd srcdocs/wiki/
git fetch origin
git merge origin/master
cd ../../tools/
