#!/usr/bin/env bash

WIKI_REPO="https://github.com/twardoch/noto-docs.wiki.git"

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

pip install --user -r py-requirements.txt
cd ../
cd srcdocs/
git clone "$WIKI_REPO" wiki
cd ../tools/
