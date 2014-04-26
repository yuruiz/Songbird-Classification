function outFileName = GetWeightFileName(WeiName, DevName, TYPE, k)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

if strcmp(DevName, 'Basic')
  outFileName = sprintf('weight/TW_%s_%s_%d.csv', WeiName, DevName, k);
else
  outFileName = sprintf('weight/TW_%s_%s_%d_%d.csv', WeiName, DevName, TYPE, k);
end
end
