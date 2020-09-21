#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: calc metric-Data

echo -n "$1;"

cat "$1" | \
awk -- 'BEGIN {
loc=0;
complexity=0;
techDebt=0;
lineDiff=0;
lastLineIndent=0;
}
/^[\r]*$/ { next;}
/^[\t ]*[\r]*$/ { next;}
/^[\t ]*\/\*/ { next;}
/^\*/ { next;}
/^[\t]+/ {
    match($0, "[^\t]");
    lineIndent=RSTART;
    complexity+=lineIndent;
    if (lineIndent != lastLineIndent) {
      lineDiff++;
    }
    lastLineIndent=lineIndent;
    next;
}
/^[ ]+/ {
    match($0, "[^ ]");
    lineIndent=RSTART/2;
    complexity+=lineIndent;
    if (lineIndent != lastLineIndent) {
      lineDiff++;
    }
    lastLineIndent=lineIndent;
    next;
}
/^[^ \t]*/ {
    lineIndent=0;
    complexity+=lineIndent;
    if (lineIndent != lastLineIndent) {
      lineDiff++;
    }
    lastLineIndent=lineIndent;
    next;
}

END {
 loc=NR;
  printf("%d;%d;%d;%d;%d;%d" , loc,  complexity, 0,0, 0, lineDiff);

}'

echo ""
