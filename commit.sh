#!/bin/sh
set -e
SOURCE_REPO=$1
SOURCE_DIR=$(basename "$SOURCE_REPO")
echo "SOURCE=$SOURCE_REPO"
git config --global user.email "$EMAIL"
git config --global user.name "$NAME"
git clone "$SOURCE_REPO" "$SOURCE_DIR"
cd "$SOURCE_DIR"
if [ -f tmp.txt ]; then
    cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 > tmp.txt
else
    touch tmp.txt
    cat /dev/urandom | env LC_CTYPE=C tr -dc 'a-zA-Z0-9' | fold -w 64 | head -n 1 > tmp.txt
fi
git add .
git commit -m "auto update"
git push origin $BRANCH_FOR_SOURCE_REPO --force

echo "done"
