#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric keyword substitution for all Files
#

scriptpwd=`dirname "$0"`
"${scriptpwd}/metricUpdate.sh" `find . -type f | xargs grep -l "# Complexity"`

