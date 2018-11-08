#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric helper-functions and variables

countCommits() {
  commitFile="$1"
  commits=0
  commits=`git log --follow --oneline -- "$commitFile" | wc -l`
}

setBreakPointTechDebt() {
  breakPointTechDebt=100
}

setBreakPointCommits() {
  breakPointCommits=100
}

setBreakPointComplexity() {
  breakPointComplexity=1500
}

setBreakPointLoc() {
  breakPointLoc=1000
}
setAllBreakPoints() {
  setBreakPointCommits
  setBreakPointComplexity
  setBreakPointLoc
  setBreakPointTechDebt
}


setCommitSubstitution() {
  commitSubstitution="\1# Commits : $commits <! $breakPointCommits #"
}

commitPattern="\(.*\)# Commits *:.*#"
commitPatternClean="\(.*# Commits *:\).*\( #.*\)"

locPatternClean="\(.*# Loc *:\).*\( #.*\)"

metricPatternClean="\(.*# Complexity *:\).*\( #.*\)"

techDebtPatternClean="\(.*# tech\. Debt *:\).*\( #.*\)"



