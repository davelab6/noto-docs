#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./build.command
git push
sh ./push-all.command
