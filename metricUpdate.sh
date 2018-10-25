#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric keyword substitution 

files="$@"
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
  commits=`git log --follow --oneline -- "$file" | wc -l`
  cat "$file" | \
    metricUpdateSmudge | \
    sed "s/\(.*\)# Commits *:.*#/\1# Commits  : $commits Benchmark: 100 #/" > "/tmp/$filename"
  mv "/tmp/$filename" "$file"
done
