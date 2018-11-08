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

testwithKeywordCommits() {
  testfile="data/withKeywordCommits.txt"
  resultFile="/tmp/withKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  diff "$testfile" "$resultFile" | \
    egrep "# Commits *:.* <! .*#" > /dev/null
  assertEquals "Keyword Commit"  0 "$?"
  rm  -f "$resultFile"
}

testwithKeywordComplexity() {
  testfile="data/withKeywordComplexity.txt"
  resultFile="/tmp/withKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  diff "$testfile" "$resultFile"  | \
    egrep "#.* Complexity *:.* <! .*#" > /dev/null
  assertEquals "Keyword Complexity"  0 "$?"
  rm  -f "$resultFile"
}

testwithKeywordComplexity2() {
  testfile="data/withKeywordComplexity2.txt"
  resultFile="/tmp/withKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  complexity=`cat "$resultFile"  | \
    egrep "#.* Complexity *:.* <! .*#" | \
    sed "s/.*Complexity *: *\([0-9]*\) .*/\1/"`
  assertEquals "Keyword Complexity"  5 "$complexity"
  rm  -f "$resultFile"
}

testwithKeywordComplexityLoc() {
  testfile="data/withKeywordComplexity2.txt"
  resultFile="/tmp/withKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  complexity=`cat "$resultFile"  | \
    egrep "#.* Loc *:.* <! .*#" | \
    sed "s/.*Loc *: *\([0-9]*\) .*/\1/"`
  assertEquals "Keyword Loc"  6 "$complexity"
  rm  -f "$resultFile"
}


testwithKeywordComplexityCommits() {
  testfile="data/withKeywordComplexityCommits.txt"
  resultFile="/tmp/withKeywordsfile.txt"
  cat "$testfile" | \
    ../metricUpdateSmudge "$testfile" > "$resultFile"
  lines=`diff "$testfile" "$resultFile"  | \
    egrep "#.* Complexity *:.*<!.*#|# Commits *:.* <! .*#" | \
    wc -l`
  assertEquals "Keyword Complexity and Commit"  2 "$lines"
  rm  -f "$resultFile"
}

. ../lib/shunit2

