#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: deleteing metric keywords


files="$@"
scriptpwd=`dirname "$0"`
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
  cat "$file" | \
    "${scriptpwd}/metricUpdateClean" "$file" > "${file}.tmp"
  mv "${file}.tmp" "$file"
done

