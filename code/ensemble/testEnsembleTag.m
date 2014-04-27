function [accuracy, rate] = testEnsembleTag(WeiName, DevName, TYPE, k, tag, threshold, usePrior)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

#clear;

weightFileName = GetWeightFileName(WeiName, DevName, TYPE, k, usePrior);
fprintf('Loading training weights...\n');
trainWeights = load(weightFileName);

[C, T, indices] = LoadInputs(tag);
if strcmp(tag, 'train')
  C = GetSubMatrix(C, indices); 
end
L=size(C, 2);
weights=zeros(1, L);
for l=1:L,
  ind = find(trainWeights(1, :)==indices(l));
  if !isempty(ind) 
    weights(l) = trainWeights(2, ind);
  end
end;

%[CO, MO] = WeightedMajority(C, weights);
%accuracy = PrintAccuracy(CO, T);
%fprintf('Accuracy is %0.2f\n', accuracy);
[CO, MO] = PriorWeightedMajority(C, T, weights, usePrior);
[accuracy, rate] = ThreshAccuracy(CO, T, MO, threshold);
fprintf('Accuracy is %0.2f, %0.2f\n', accuracy, rate);

%csvwrite('result/majvotes.csv', CO);

end

