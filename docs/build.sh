#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# current working DIR
ORIGINAL_DIR="${PWD}"

# build
cd "$SCRIPT_DIR/../bucket-website"
elm-spa build

# copy files
cd "$SCRIPT_DIR"
cp -a "${SCRIPT_DIR}/../bucket-website/public/." .

# go back to original dir
cd "$ORIGINAL_DIR"

# commit (msg via stdin)
git add -A
# ... and publish
git push origin main

# checkout pages, merge main, commit & push
git checkout pages
git merge main
git commit
git push origin pages
