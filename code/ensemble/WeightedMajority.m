function [labels] = WeightedMajority(C,weights);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

m=size(C, 1);
L=size(C, 2);

options = unique(C);

O = size(options, 1);

OPTIONS = repmat(options, [1, L, m]);

B = bsxfun(@eq, permute(C, [3 2 1]) ,OPTIONS);

W = squeeze(sum(bsxfun(@times, repmat(weights, O, 1), B), 2))';

[xx, i] = max(W, [], 2);
labels = options(i);

end
