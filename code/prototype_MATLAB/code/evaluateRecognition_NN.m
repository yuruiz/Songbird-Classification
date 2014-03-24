% build confusion matrix C
% C(i,j) of a confusion matrix counts the number of instances of class i that were predicted as class j.
clear;
addpath(genpath('release'));
load traintest.mat
load dictionary.mat
load system.mat


testFeatures = zeros(length(testPaths),size(dictionary,1));
invalid = zeros(size(testLabels));

% get test histograms
for k = 1:length(testPaths)
    path = testPaths{k};
    wordMap = getWordMap(path,dictionary);
    if isempty(wordMap)
        invalid(k) = 1;
    else
        testFeatures(k,:) = getBoWFeature(wordMap, size(dictionary,1)); 
    end
end
invalid = logical(invalid);
testFeatures(invalid,:) = [];
testLabels(invalid) = [];

save test testFeatures testLabels

chisqDist = pdist2(testFeatures, trainFeatures,'chisq');
eucDist = pdist2(testFeatures, trainFeatures,'euclidean');

% TODO from here
[~,idx_chisq]=min(chisqDist,[],2);
[~,idx_euc]=min(eucDist,[],2);

predict_chisq = trainLabels(idx_chisq);
predict_euc = trainLabels(idx_euc);

accuracy_chisq = sum(predict_chisq == testLabels)/length(testLabels);
accuracy_euc = sum(predict_euc == testLabels)/length(testLabels);

% TODO from here: confusion matrix

% % initialize C
% C = zeros(length(mapping),length(mapping));
% 
% for i = 1:length(mapping)
%     for j = 1:length(mapping)
%         C(i,j) = sum(predict == j & csTss == i);
%     end
% end