function [A] = GetAccuracyRates(B);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

L=size(B, 2);

A = zeros(1, L);
for l=1:L
  A(l) = sum(B(:,l))/L;
end
end
