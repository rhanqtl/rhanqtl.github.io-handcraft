#!/usr/bin/env bash

# set -x
set -e

SRC_BRANCH='master'
DST_BRANCH='gh-pages'

if [[ -n $(git status -s) ]]; then
  echo "!!! You still have uncommitted changes !!!"
  git status
  exit 1
fi

git switch "${SRC_BRANCH}"
find content -name '*.ad' | xargs -n1 bash scripts/cvt.sh
if [[ -d build ]]; then
  rm -rf build/**
else
  mkdir build
fi
cp -r content/** build
find build -name '*.ad' -or -name 'a.out' -or -name '*.exe' | xargs rm -rf

git switch "${DST_BRANCH}"
find . -mindepth 1 -not -name 'build' -not -path './build/*' -not -name 'CNAME' -not -name '.git' -not -path './.git/*' -exec rm -rf {} +
cp -r build/** .
rm -rf build
git add . && git commit -m "publish $(date)" && git push

git switch "${SRC_BRANCH}"
find -name '*.html' -exec rm {} +
