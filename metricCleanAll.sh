#!/bin/sh
# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: deleting metric keyword for all files
#

metricClean.sh `find . -type f | xargs grep -l "# Complexity"`
