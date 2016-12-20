#!/usr/bin/env bash
echo "$" build.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../srcdocs/

r="mkdocs build --clean"
echo "$" $r
eval $r

echo "$" git add .
git add .

echo "$" git commit -am "docs build: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git commit -am "docs build: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 

cd ../tools/
