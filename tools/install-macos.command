#!/usr/bin/env bash
echo "$" install.command

WIKI_REPO="https://github.com/twardoch/noto-docs.wiki.git"

dir=${0%/*}
if [ "$dir" = "$0" ]; then
  dir="."
fi
cd "$dir"

echo "$" pip install --user -r py-requirements.txt
pip install --user -r py-requirements.txt

cd ../
cd srcdocs/

echo "$" git clone "$WIKI_REPO" wiki
git clone "$WIKI_REPO" wiki

cd ../tools/
