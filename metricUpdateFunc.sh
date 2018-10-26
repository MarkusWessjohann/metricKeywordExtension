#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric helper-functions and variables

countCommits() {
  commitFile="$1"
  commits=0
  commits=`git log --follow --oneline -- "$commitFile" | wc -l`
}

setBreakPointCommits() {
  breakPointCommits=100
}

setCommitSubstitution() {
  commitSubstitution="\1# Commits : $commits <! $breakPointCommits #"
}

commitPattern="\(.*\)# Commits *:.*#"
commitPatternClean="\(.*# Commits *:\).*\( #.*\)"

metricPatternClean="\(.*# Metric *:\).*\( #.*\)"




