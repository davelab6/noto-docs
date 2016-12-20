#!/usr/bin/env bash
dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

cd ../srcdocs/
open http://127.0.0.1:8000
mkdocs serve
cd ../tools/
