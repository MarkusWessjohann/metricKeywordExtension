#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: deleting metric keyword for all files
#

scriptpwd=`dirname "$0"`
"${scriptpwd}/metricClean.sh" `find . -type f | xargs grep -l "# Complexity"`
