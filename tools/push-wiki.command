#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../
cd srcdocs/wiki/
git add --all
git commit -am "$(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git fetch origin
git merge origin/master -m "$(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git push -u origin master 
cd ../../tools/
