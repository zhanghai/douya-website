#!/bin/bash

set -e

mkdir -p ./deploy/
rm -r ./deploy/
gulp
cp -r ./dist/. ./.deploy/
touch ./.deploy/.nojekyll
