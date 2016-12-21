#!/usr/bin/env bash
echo "$" push-wiki.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../
cd srcdocs/wiki/

echo "$" git add --all
git add --all

echo "$" git commit -am "wiki up: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git commit -am "wiki up: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 

#echo "$" git push
#git push

echo "$" git fetch origin
git fetch origin

echo "$" git merge origin/master -m "wiki merge: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git merge origin/master -m "wiki merge: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 

echo "$" git push -u origin master 
git push -u origin master 

cd ../../tools/
