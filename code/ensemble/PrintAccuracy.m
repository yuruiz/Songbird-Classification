function [accuracy] = PrintAccuracy(CO, T)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

res = (CO == T);
accuracy = numel(res(res == 1)) / numel(res) * 100;

end
