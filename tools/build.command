#!/usr/bin/env bash
echo "$" build.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../srcdocs/

_="mkdocs build --clean"
echo "$" $_
eval $_

echo "$" git add .
git add .

echo "$" git commit -am "docs build: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
git commit -am "docs build: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 

cd ../tools/
