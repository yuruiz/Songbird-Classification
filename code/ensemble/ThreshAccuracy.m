function [accuracy, rate] = ThreshAccuracy(CO, T, MO, th)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014
m=length(T);
n = 0;
v = 0;
for i=1:m
  if MO(i)<th 
    continue;
  end
  n++;
  if CO(i)==T(i) 
    v++;
  end
end
res = (CO == T);
accuracy = (v+0.00001) / (n+0.00001) * 100;
rate = n/m*100;
end
