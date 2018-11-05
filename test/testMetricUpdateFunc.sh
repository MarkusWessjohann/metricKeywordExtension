#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc:  test for metricUpdateFunc.sh


. ../metricUpdateFunc.sh

testcountCommits() {
  countCommits "noFile"
  assertEquals "no file"  0 "$commits"
}

. ../lib/shunit2

