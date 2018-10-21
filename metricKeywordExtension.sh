#!/bin/sh
# Author: MarkusWessjohann
# Date: 19.10.2018
# Desc: Metric Filter for git

tempFile="/tmp/commitfile.$RANDOM"
cat - > "$tempFile"

complexity=`cat "$tempfile" | \
sed "s/^\([ \t]*\).*$/\1/" | \
  sed "s/  / /" | \
  tr -d "\n" | \
  wc -c`

loc=10
cat "$tempfile" |  \
  sed -e "s/\$complexity:.*\$/\$complexity: $complexity \$/"
      -e "s/\$loc:.*\$/\$loc: $loc \$/"
