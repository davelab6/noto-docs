#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./push-wiki.command

cd ../
git add --all 
git commit -am "$(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git fetch origin
git merge origin/master
git push -u origin master 
cd ./tools/
