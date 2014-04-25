#!/bin/sh
# Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
# Created/Modified: Apr 24, 2014

MPLFILE="./test.m"
rm $MPLFILE
echo "weightsStr=\"${1}\";" > $MPLFILE
cat ./runWeightedMajority.m >> $MPLFILE
octave $MPLFILE

