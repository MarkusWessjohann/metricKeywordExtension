#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric keyword substitution 
#       Inserts # Commits

. metricUpdateFunc.sh

files="$@"
if [ "$#" -eq 0 ]
then
  [ -d ".git" ] || cd ..
  files=`git diff --name-only`
fi

setBreakPointCommits

for file in $files
do
  [ -f "$file" ] || continue
  filename=`basename "$file"`
  echo "Processing file: $filename"
  cat "$file" | \
  metricUpdateSmudge "$file" > "${file}.tmp"
  mv "${file}.tmp" "$file"
done
