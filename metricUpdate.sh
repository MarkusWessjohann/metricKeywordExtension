#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric keyword substitution 

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
  countCommits "$file"
  setCommitSubstitution
  cat "$file" | \
    metricUpdateSmudge | \
    sed "s/$commitPattern/$commitSubstitution/" > "/tmp/$filename"
  mv "/tmp/$filename" "$file"
done
