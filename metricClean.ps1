# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: deleting metric keywords
#      Deleting : 
#       * Complexity
#       * LineDiff
#       * LOC
#       * # Commits
#       * techn. Debt
Param(
 [String[]]$files
)
git-bash.exe metricClean.sh $files
