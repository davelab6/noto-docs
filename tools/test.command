#!/usr/bin/env bash
echo "$" test.command
echo "Wait a few seconds!"
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../srcdocs/
open http://127.0.0.1:8000
mkdocs serve
cd ../tools/
