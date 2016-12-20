#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./push-wiki.command

cd ../
git add --all 
git commit -am "repo up: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git push
git fetch origin
git merge origin/master -m "repo merge: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git push -u origin master 
cd ./tools/
