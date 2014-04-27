function [labels, maxval] = PriorWeightedMajority(C, T, weights, usePrior);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

m=size(C, 1);
L=size(C, 2);

options = unique(C);
O = size(options, 1);
labels = zeros(m, 1);
maxval = zeros(m, 1);

if usePrior
  Priors = zeros(O,O,L);
  for l=1:L
    Priors(:, :, l) = GetClassPrior(C(:,l), T, options);
  end
end

for i=1:m
  VoteArray = zeros(O, 1);
  row = C(i, :);
  for l=1:L
    index = find(options==row(l));
    if usePrior
      VoteArray += weights(l)*Priors(:, index, l);
    else 
      VoteArray(index) += weights(l);
    end
  end
  VoteArray = normalize(VoteArray);
  [xx, id] = max(VoteArray);
  labels(i, 1) = options(id);
  maxval(i, 1) = xx;
end
end
