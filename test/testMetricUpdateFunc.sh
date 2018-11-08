#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc:  test for metricUpdateFunc.sh


. ../metricUpdateFunc.sh

testcountCommits() {
  countCommits "noFile"
  assertEquals "no file"  0 "$commits"
}

testcountCommitsSelf() {
  countCommits "$0"
  assertEquals "self"  3 "$commits"
}

testsetBreakPoints() {
  setAllBreakPoints
  assertTrue "LOC breakpoint is set"  "[ $breakPointLoc -ge 1000 ]"
  assertTrue "Complextity breakpoint is set"  "[ $breakPointComplexity -ge 1500 ]"
  assertTrue "Commit breakpoint is set"  "[ $breakPointCommits -ge 100 ]"
}


. ../lib/shunit2

