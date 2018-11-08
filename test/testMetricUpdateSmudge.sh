#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc:  test for metricUpdateSmudge


. ../metricUpdateFunc.sh

testwithoutKeywords() {
  testfile="data/withoutKeywords.txt"
  resultFile="/tmp/withoutKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  diff "$testfile" "$resultFile"
  assertEquals "no Keywords"  0 "$?"
  rm  -f "$resultFile"
}
. ../lib/shunit2

