function [prior] = GetClassPrior(C1, T, options);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

m=length(C1);
o=length(options);

prior = zeros(o);

for i=1:m
  ci = find(options==C1(i));
  ti = find(options==T(i));
  prior(ci, ti)++; 
end

end
