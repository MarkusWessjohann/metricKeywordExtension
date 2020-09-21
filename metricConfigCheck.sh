#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: Checks if the metric keyword substitutions is correkt configurated
#

find . -name ".gitattributes" | \
  xargs grep -- "filter=metricUpdateFilter" 2>&1 > /dev/null

if [ "$?" -ne 0 ]
then
  echo "No metric filter is defined in .gitattributes"
  exit 1
fi

git config -l | \
  grep "filter.metricUpdateFilter" 2>&1 > /dev/null

if [ "$?" -ne 0 ]
then
  echo "metric filter is not configurated. Use git config -e"
  exit 1
fi

(type metricUpdateClean && type metricBreakPoints.sh ) 2>&1 > /dev/null
if [ "$?" -ne 0 ]
then
  echo "metric filter is not in PATH"
  exit 1
fi

echo "metric filter is correct configurated"
