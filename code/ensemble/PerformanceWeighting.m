function [weights] = PerformanceWeighting(C,T);
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

B = ToMBinLabel(C, T);
weights = GetAccuracyRates(B);

end
