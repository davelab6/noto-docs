#!/usr/bin/env bash
echo "$" push-all.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./pull-wiki.command

cd ../

echo "$" git fetch origin
git fetch origin

echo "$" git merge origin/master
git merge origin/master

cd ./tools/
