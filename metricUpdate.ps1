# Author: MarkusWessjohann
# Date: 24.08.2017
# Desc: metric keyword substitution 
#       Inserts : 
#       * Complexity
#       * LineDiff
#       * LOC
#       * # Commits
#       * techn. Debt
Param(
 [String[]]$files
)
git-bash.exe metricUpdate.sh $files
