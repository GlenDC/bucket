#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# current working DIR
ORIGINAL_DIR="${PWD}"

# build
echo "building bucket website..."
echo
cd "$SCRIPT_DIR/../bucket-website"
elm-spa build
echo "-----------------------------------------------------------"
echo

# copy files
echo "copying bucket website content from ${SCRIPT_DIR}/../bucket-website/public ..."
echo
cd "$SCRIPT_DIR"
cp -a "${SCRIPT_DIR}/../bucket-website/public/." .
echo "-----------------------------------------------------------"
echo

# go back to original dir
cd "$ORIGINAL_DIR"

echo "git publishing pages (branch) content ..."
echo
# checkout pages, merge main, commit & push
git checkout pages
git merge main
git add -A
git commit
git push origin pages
echo "-----------------------------------------------------------"
echo

echo "Done ..."
echo
# back to main page
git checkout main

echo "Bye :)"
