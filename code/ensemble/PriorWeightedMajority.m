function [labels] = PriorWeightedMajority(C, T, weights);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

m=size(C, 1);
L=size(C, 2);

options = unique(C);
O = size(options, 1);
labels = zeros(m, 1);

Priors = zeros(O,O,L);

for l=1:L
  Priors(:, :, l) = GetClassPrior(C(:,l), T, options);
end
VoteArray = zeros(O, 1);
for i=1:m
  row = C(i, :);
  for l=1:L
    index = find(options==row(l));
    VoteArray += weights(l)*Priors(:, index, l);
  end
  [xx, id] = max(VoteArray);
  labels(i, 1) = options(id);
  VoteArray = 0;
end
end
