#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../srcdocs/
mkdocs build --clean
git add .
git commit -am "docs build: $(whoami) $(date +'%Y-%m-%d %H:%M:%S')" 
cd ../tools/
