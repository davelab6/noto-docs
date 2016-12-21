#!/usr/bin/env bash
echo "$" build-push-all.command
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

sh ./build.command

#echo "$" git push
#git push

sh ./push-all.command
