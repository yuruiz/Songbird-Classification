function [subsubindices] = GetSubSubIndices(indices, subIndices)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014
subL = length(subIndices);
for l=1:subL
  subsubindices(l)=indices(subIndices(l));
end

end
