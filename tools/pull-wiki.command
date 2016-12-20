#!/usr/bin/env bash
echo "$" pull-wiki.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../
cd srcdocs/wiki/

echo "$" git fetch origin
git fetch origin

echo "$" git merge origin/master
git merge origin/master

cd ../../tools/
