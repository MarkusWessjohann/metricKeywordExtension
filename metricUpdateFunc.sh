#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric helper-functions and variables

. metricBreakPoints.sh

countCommits() {
  commitFile="$1"
  commits=0
  commits=`git log --follow --oneline -- "$commitFile" | wc -l`
}

setCommitSubstitution() {
  commitSubstitution="\1# Commits : $commits <! $breakPointCommits #"
}

commitPattern="\(.*\)# Commits *:.*#"
commitPatternClean="\(.*# Commits *:\).*\( #.*\)"

locPatternClean="\(.*# Loc *:\).*\( #.*\)"

metricPatternClean="\(.*# Complexity *:\).*\( #.*\)"

techDebtPatternClean="\(.*# tech\. Debt *:\).*\( #.*\)"

lineDiffPatternClean="\(.*# LineDiff *:\).*\( #.*\)"


