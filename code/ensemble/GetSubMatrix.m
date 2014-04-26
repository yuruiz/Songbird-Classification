function subC = GetSubMatrix(C, indices)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

subL=length(indices);
m=size(C,1);
subC=zeros(m, subL);

for l=1:subL
  subC(:, l) = C(:, indices(l));
end

end
