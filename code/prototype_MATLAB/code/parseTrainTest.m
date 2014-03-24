clear;
load allPathAndLabel;

sample_sz = 100;
testRatio = 0.2;

uq = unique(allLabels);
cls_sample_num = zeros(size(uq));

for k = 1:length(uq)
    l = uq(k);
    cls_sample_num(k) = sum(allLabels == l);
end

valid_cls = find(cls_sample_num >= sample_sz);

% sampleLabels = [];
% samplePaths = [];
% sampleSpecies = [];

trainLabels = [];
testLabels = [];
trainPaths = [];
testPaths = [];
trainSpecies = [];
testSpecies = [];

% set seed
s = RandStream('mcg16807','Seed',0);
RandStream.setGlobalStream(s);

for k = 1:length(valid_cls)
    idx = find(allLabels == valid_cls(k));
    idx = idx(randperm(length(idx),sample_sz));
    test_idx = idx(1:round(testRatio*sample_sz));
    train_idx = idx(round(testRatio*sample_sz)+1:end);
    
    trainLabels = [trainLabels, allLabels(train_idx)];
    trainPaths = [trainPaths, allPaths(train_idx)];
    trainSpecies = [trainSpecies, allSpecies(train_idx)];
    
    testLabels = [testLabels, allLabels(test_idx)];
    testPaths = [testPaths, allPaths(test_idx)];
    testSpecies = [testSpecies, allSpecies(test_idx)];
    
end

ttPaths = [trainPaths,testPaths];
ttLabels = [trainLabels,testLabels];
ttSpecies = [trainSpecies,testSpecies];


save traintest trainLabels trainPaths trainSpecies testLabels testPaths testSpecies mapping ttPaths ttLabels ttSpecies;

