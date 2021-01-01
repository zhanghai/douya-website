#!/bin/bash

set -e

# Ensure and cd to .deploy
if [[ ! -d .deploy ]]; then
    if [[ -e .deploy ]]; then
        echo "ERROR: .deploy is not a directory"
        exit 1
    fi
    mkdir .deploy
    cd .deploy
    git init
    git symbolic-ref HEAD refs/heads/gh-pages
    git remote add origin git@github.com:zhanghai/douya.zhanghai.me.git
    cd ..
fi

# Build
./build.sh

# Deploy
cd .deploy
git add -A
git commit -m "Site updated: $(date -R)"
git push -u origin gh-pages
