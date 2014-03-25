clear;
addpath(genpath('release'));
load traintest trainPaths;
toProcess = trainPaths;
[dictionary] = getDictionary(toProcess);
save('dictionary.mat','dictionary');
clear toProcess