#!/usr/bin/env bash

find -name '*.ad' | xargs -n1 bash scripts/cvt.sh
