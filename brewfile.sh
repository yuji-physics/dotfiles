#!/bin/bash
BREWFILE_LINES=`cat brewfile`
for LINE in BREWFILE_LINES
do
  LINEHEAD=echo $LINE | cut -c 1-1
  if [ LINEHEAD != "#" ]; then
    "brew $LINE"
  fi
done
