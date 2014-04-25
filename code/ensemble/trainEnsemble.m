function accuracy = trainEnsemble(WeiName, DevName, TYPE, k)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

#clear;

[C, T, indices] = LoadInputs('train');

C = GetSubMatrix(C, indices); 

m=size(C, 1);
L=size(C, 2);

#Systematic Search
if strcmp(DevName, 'Basic') || L<=k
  subIndices = (1:L)';
else
  DevMethod = str2func(DevName);
  subIndices = SystematicSearchK(C,T, DevMethod, TYPE, k);
  C = GetSubMatrix(C, subIndices); 
  L = length(subIndices);
end

WeiName
strcmp(WeiName, 'Basic')
if strcmp(WeiName, 'Basic')
  weights=ones(1, L);
else
  WeiMethod = str2func(WeiName);
  weights = WeiMethod(C,T);
end
weights = normalize(weights);

CO = WeightedMajority(C, weights);
%//csvwrite('majvotes.csv', CO);
accuracy = PrintAccuracy(CO, T);
fprintf('Accuracy is %0.2f\n', accuracy);

results(1,:)= GetSubSubIndices(indices,subIndices);
results(2,:)= weights;

weightFileName = GetWeightFileName(WeiName, DevName, TYPE, k);
csvwrite(weightFileName, results);

end
