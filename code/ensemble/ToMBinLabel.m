function binLabels = ToMBinLabel(C, T)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

m=size(C, 1);
L=size(C, 2);

binLabels = zeros(m, L);
for l=1:L
  binLabels(:, l) = ToSBinLabel(C(:, l), T);
end

end
