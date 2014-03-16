#!/usr/bin/python
#
# File:         runFullPipeline.py
# Author:       Joseph A. Russino (jrussino@rec.ri.cmu.edu)
# Date:         03/16/2014 
# 
# Description:  Main script for the project. This script runs each of the 
#               pipeline scripts in order, in order to produce the complete
#               set of results from the input training and test data.
#               Inputs are:
#               - TODO
#               Outputs are:
#               - TODO
#               
# Copyright (C) 2014 the project authors:
# Hsiao-Yu Tung       (htung@andrew.cmu.edu)
# De-An Huang         (deanh@andrew.cmu.edu)
# Xiao-Feng Xie       (xfxie@cs.cmu.edu)
# Yurui Zhu           (yuruiz@andrew.cmu.edu)
# Joseph A. Russino   (jrussino@rec.ri.cmu.edu)
    
import segmentation
import featureExtraction
import training
import classification
import training
import evaluation
