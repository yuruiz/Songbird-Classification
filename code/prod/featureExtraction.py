#!/usr/bin/python
# File:         featureExtraction.py
# Author:       Joseph A. Russino
# Date:         03/16/2014 
# 
# Description:  Contains functions for transforming pre-processed and segmented
#               audio data and producing features for classification. 
#               Inputs:
#               - CSV file with rows consisting of [ID,num_segments,path_to_spectrogram,path_to_segment_1_mask,...,path_to_segment_N_mask]
#               Outputs:
#               - CSV file with rows consisting of [ID,feature_1,...,feature_M]
#
# Copyright (C) 2014 the project authors:
# Hsiao-Yu Tung       (htung@andrew.cmu.edu)
# De-An Huang         (deanh@andrew.cmu.edu)
# Xiao-Feng Xie       (xfxie@cs.cmu.edu)
# Yurui Zhu           (yuruiz@andrew.cmu.edu)
# Joseph A. Russino   (jrussino@rec.ri.cmu.edu)
    
import cv2
import numpy as np
import songbirdCommon

def normalizeValue(value,normRange) :
  return (value-normRange[0])/(normRange[1]-normRange[0])

# Min, max, average, standard deviation for a grayscale image
def getMinMaxAvgStd(image,normalize=True,normRange=(0.,255.)) :
  minVal = np.min(image)
  maxVal = np.max(image)
  avgVal = np.average(image)
  stdVal = np.std(image)
  if normalize :
    retVal = [normalizeValue(minVal,normRange),normalizeValue(maxVal,normRange),normalizeValue(avgVal,normRange),normalizeValue(stdVal,normRange)]
  else :
    retVal = [minVal,maxVal,avgVal,stdVal]
  return  retVal

def getImageWideStatistics(image) :
  retVal = []
  # get full-image stats
  fullImageStats = getMinMaxAvgStd(image)
  for stat in fullImageStats :
    retVal.append(stat)
  # divide into 16 frequency bins and get stats per-bin
  freqBinSize = image.shape[0]/16.
  for bin in xrange(0,16) :
    binImage = image[bin*freqBinSize:(bin+1)*freqBinSize,:]
    binStats = getMinMaxAvgStd(binImage)
    for stat in binStats :
      retVal.append(stat)
  return retVal


# MAIN - run as a standalone script for testing feature generation
if __name__=='__main__' :

  # load test file(s)
  testFileDir = '/home/jrussino/10-701/project/Songbird-Classification/samples/' 
  testFile = testFileDir + 'AMRE_AHY-M_2480-72156.png'
  testImage = cv2.imread(testFile)

  # convert to grayscale
  grayImage = cv2.cvtColor(testImage, cv2.COLOR_BGR2GRAY)
  cv2.imwrite('grayImage.png',grayImage)

  # print some basic info
  print grayImage.shape
  print grayImage.dtype

  # get basic image-wide features
  fullImageFeatures = getImageWideStatistics(grayImage)

  # display results
  print 'Computed ' + str(len(fullImageFeatures)) + ' features for this image: '
  print ','.join(str(x) for x in fullImageFeatures)

