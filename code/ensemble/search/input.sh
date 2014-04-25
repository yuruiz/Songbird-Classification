#!/bin/sh

MPLFILE="./test.m"
rm $MPLFILE
echo "weightsStr=\"${1}\"" > $MPLFILE
cat ./runWeightedMajority.m >> $MPLFILE
octave $MPLFILE

