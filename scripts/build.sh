#!/usr/bin/env bash

find -name '*.ad' | xargs -n1 bash scripts/cvt.sh
mkdir build
cp -r content/** build

git checkout gh-pages

cp build/** .
find -name '*.ad' | xargs rm
