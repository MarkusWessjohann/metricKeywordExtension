#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: deleteing metric keywords

files=`cygpath -u "$@"`
scriptpwd=`cygpath -u "$0"`
scriptpwd=`dirname "$scriptpwd"`
if [ "$#" -eq 0 ]
then
  [ -d ".git" ] || cd ..
  files=`git diff --name-only`
fi

for file in $files
do
  [ -f "$file" ] || continue
  filename=`basename "$file"`
  echo "Processing file: $filename"
done
