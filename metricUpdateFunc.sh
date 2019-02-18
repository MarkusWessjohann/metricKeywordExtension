#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric helper-functions and variables

. metricBreakPoints.sh

countCommits() {
  commitFile="$1"
  commits=0
  filename=`basename "$commitFile"`
  commits=`git log --follow --name-only -- "$commitFile" |grep "$filename" | wc -l`
}
commitPattern="# Commits *:.*#"
commitPatternClean="\(.*# Commits *:\).*\( #.*\)"

locPattern="# Loc *:.*#"
locPatternClean="\(.*# Loc *:\).*\( #.*\)"

metricPattern="# Complexity *:.*#"
metricPatternClean="\(.*# Complexity *:\).*\( #.*\)"

techDebtPattern="# tech. Debt *:.*#"
techDebtPatternClean="\(.*# tech\. Debt *:\).*\( #.*\)"

lineDiffPattern="# LineDiff *:.*#"
lineDiffPatternClean="\(.*# LineDiff *:\).*\( #.*\)"


