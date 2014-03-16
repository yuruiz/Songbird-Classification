The code for this project is divided into the following directories:

prod - contians all "production" code, i.e. code that will be used to process
       training and test data, generate results, and produce an evaluation of
       those results.
util - contains all miscellaneous code that we use in the course of development
       (e.g. for analysis, exploration) but that is not used to generat our
       final results.


The code in prod/ is divided into five separate files:

segmentation -  Takes in raw training and test data, and runs pre-processing and
                segmentation
featureExtraction - Takes in processed, segmented inputs and produces the
                    feature vectors that are used for classification.
training -  Takes in list of feature vectors and labels for training data and
            outputs classifier parameters.
classification -  Takes in classifier parameters and list of feature vectors for
                  test data and outputs list of predicted labels for test data.
evaluation -  Takes in list of test labels from classifier prediction and
              "ground truth" labels for test data and produces a report of the
              classification performance

There are two additional files in the prod/ directory:

runFullPipeline - A script that runs all steps in order to produce our final
                  results from the input data

songbirdCommon - Contains all common variables and functions.

