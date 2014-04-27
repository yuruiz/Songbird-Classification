function outFileName = GetWeightFileName(WeiName, DevName, TYPE, k, usePrior)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

if strcmp(DevName, 'Basic')
  outFileName = sprintf('weight/TW_%s_%s_%i_%d.csv', WeiName, DevName, usePrior, k);
else
  outFileName = sprintf('weight/TW_%s_%s_%d_%i_%d.csv', WeiName, DevName, TYPE, usePrior, k);
end
end
