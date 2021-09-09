#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# current working DIR
ORIGINAL_DIR="${PWD}"

echo "switching to pages git branch and merge main..."
echo
git checkout pages
git merge main
echo "-----------------------------------------------------------"
echo

# build
echo "building bucket website..."
echo
cd "$SCRIPT_DIR/../bucket-website"
elm-pages build
echo "-----------------------------------------------------------"
echo

# copy files
echo "copying bucket website content from ${SCRIPT_DIR}/../bucket-website/public ..."
echo
cd "$SCRIPT_DIR"
cp -a "${SCRIPT_DIR}/../bucket-website/dist/." .
echo "-----------------------------------------------------------"
echo

# go back to original dir
cd "$ORIGINAL_DIR"

echo "git publishing pages (branch) content ..."
echo
# ommit & push to pages branch
git add -A
git commit
git push origin pages
echo "-----------------------------------------------------------"
echo

# and back to main branch
echo "Done ..."
echo "switching back to pages git branch..."
echo
git checkout main

echo "Bye :)"
