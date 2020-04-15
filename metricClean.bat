@ECHO OFF
REM  Author: MarkusWessjohann
REM  REM  Date: 24.08.2017
REM  REM  Desc: deleting metric keywords
REM  REM       Deleting :
REM  REM        * Complexity
REM  REM        * LineDiff
REM  REM        * LOC
REM  REM        * REM  Commits
REM  REM        * techn. Debt
pause
REM
git-bash.exe <PATH>/metricClean.sh %*
pause
REM
