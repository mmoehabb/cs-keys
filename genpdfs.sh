#!/bin/bash

if [[ -z $1 ]]; then
  echo "Usage: genpdfs <dir-path>"
  exit 1
fi

set -xe
mkdir -p ./pdfs

len=${#1}

for file in $(ls -1 $1/*.typ)
do
  file=${file:len+1}
  file_len=${#file}
  typst compile $1/$file ./pdfs/${file:0:file_len-4}.pdf
done

echo "Done."
