% build confusion matrix C
% C(i,j) of a confusion matrix counts the number of instances of class i that were predicted as class j.
clear;
load traintest.mat
load dictionary.mat
load system.mat

model = svmtrain(trainLabels', trainFeatures ,'-t 5');

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

[predicted_label, accuracy, decision_values] = svmpredict(testLabels', testFeatures,model);

% TODO from here: confusion matrix

% % initialize C
% uq = unique(testLabels);
% C = zeros(length(uq),length(uq));
% 
% for i = 1:length(uq)
%     for j = 1:length(uq)
%         
%         C(i,j) = sum(predicted_label == uq(j) & testLabels' == uq(i));
%     end
% end