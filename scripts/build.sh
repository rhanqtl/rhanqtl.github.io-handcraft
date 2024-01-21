#!/usr/bin/env bash

set -x

find -name '*.ad' | xargs -n1 bash scripts/cvt.sh

if [[ -d build ]]; then
  rm -rf build/**
else
  mkdir build
fi
cp -r content/** build
find -name '*.ad' -or -name 'a.out' -or -name '*.exe' | xargs rm

# git checkout gh-pages

# cp build/** .
