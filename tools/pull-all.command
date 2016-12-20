#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./pull-wiki.command

cd ../
git fetch origin
git merge origin/master
cd ./tools/
