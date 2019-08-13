#!/bin/bash
set -e

outputFile=/c/temp/logs/changes.txt
echo "" > $outputFile

for repo in $( ls -d */ ); do
   if [ $( ls -a $repo | grep ^.git$ ) ]; then
       cd $repo       
       echo "------------------- $repo -------------------" >> $outputFile
       git log  --author "[jJ]eff.[aA]shton@[dD]2[lL].com" --since 2016-09-12 >> $outputFile
       cd ..
    fi
done

