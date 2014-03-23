% build system.mat, containing
% 1. dictionary: word dictionary.
% 2. trainFeatures: Nxhistogram length matrix containing all of the histograms of the N training data in the data set.
% 3. trainLabels: a Nx1 vector containing the labels of each of the images.
clear;

load dictionary dictionary
load traintest trainPaths trainLabels

trainFeatures = zeros(length(trainPaths),size(dictionary,1));
invalid = zeros(size(trainLabels));

for k = 1:length(trainPaths)
    path = trainPaths{k};
    wordMap = getWordMap(path,dictionary);
    if isempty(wordMap)
        invalid(k) = 1;
    else
        trainFeatures(k,:) = getBoWFeature(wordMap, size(dictionary,1));
    end
end
invalid = logical(invalid);
trainFeatures(invalid,:) = [];
trainLabels(invalid) = [];


save system dictionary trainFeatures trainLabels;