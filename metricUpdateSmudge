#!/usr/bin/awk -f
# Author: MarkusWessjohann
# Date: 19.10.2018
# Desc: Metric git Keyword Extension
# $ Metric: $

BEGIN {
loCounter=0;
metricLineNr=0;
complexity=0; 
}

// { line[NR]=$0 ;}
/^[\t]*/ { match($0, "[^\t]");complexity+=RSTART;}
/^[ ]*/ { match($0, "[^ ]");complexity+=(RSTART/2);}
/\$ Metric: \$/ {metricLineNr=NR; print "MetricLine: ", NR;}

END { 
loCounter=NR; 
if (metricLineNr> 0) {
  newString="$ Metric: Complexity:" complexity " Loc:" loCountear " $";
  gsub("/\$ Metric:.*\$/", newString line[metricLineNr]);
}
printf("complexity: %s loc:%s\n",complexity,loCounter);
for(i=1;i<=NR;i++) 
  printf("%s\n",line[i]);
}

