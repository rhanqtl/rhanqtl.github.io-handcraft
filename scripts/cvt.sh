#!/usr/bin/env bash

if [[ ! -f "$1" ]]; then
  printf "File $1 not found"
  exit 2
fi

asciidoctor \
  --attribute=backend=html5 \
  --attribute=sectnums \
  --attribute=toc=left \
  --attribute=nofooter \
  --attribute=font-family=Inconsolata \
  --attribute=icons=font \
  --attribute=source-highlighter=pygments \
  "$1"
#:coderay-linenums-mode: table "$1"
# :rouge-css: style
# :rouge-style: thankful_eyes
