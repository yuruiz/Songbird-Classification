function accuracy = testEnsemble(WeiName, DevName, TYPE, k)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

#clear;

weightFileName = GetWeightFileName(WeiName, DevName, TYPE, k);
fprintf('Loading training weights...\n');
trainWeights = load(weightFileName);

fprintf('Loading data data...\n');
C = load('data/test.data');

fprintf('Loading data labels...\n');
T = load('data/test.label');

fprintf('Loading classifer indices...\n');
indices = load('data/test.ind');

L=size(C, 2);

weights=zeros(1, L);

for l=1:L,
  ind = find(trainWeights(1, :)==indices(l));
  if !isempty(ind) 
    weights(l) = trainWeights(2, ind);
  end
end;

CO = WeightedMajority(C, weights);
%csvwrite('result/majvotes.csv', CO);
accuracy = PrintAccuracy(CO, T);
fprintf('Accuracy is %0.2f\n', accuracy);

