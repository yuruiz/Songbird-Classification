% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

clear;

DevNames = ['Basic';'Disagreement'; 'Correlation'; 'Q_Test'; 'Double_Fault'; 'Coincident_Failure'; 'entropy'; 'Interrater_k'; 'Kohavi_Wolpert'; 'Generalized'];
TYPEs=[-1; 3; 2; 2; 2; 4; 1; 1; 0; 1];
WeiNames = ['Basic';'PerformanceWeighting'];

k=7;
TSIZE=size(DevNames, 1);
WSIZE=size(WeiNames, 1);
n =0;
for k=3:7
filename=sprintf('result/errors_%d.csv', k);
fid = fopen(filename, 'w');
for j=1:WSIZE
WeiName = strtrim(WeiNames(j,:));
for i=1:TSIZE
DevName = strtrim(DevNames(i,:));
TYPE = TYPEs(i);
WeiName, DevName, TYPE, k
TrainError=trainEnsemble(WeiName, DevName, TYPE, k);
#testEnsembleTag(WeiName, DevName, TYPE, k, 'train');
TestError=testEnsembleTag(WeiName, DevName, TYPE, k, 'test');
fprintf(fid, '%s,%s,%d,%d,%0.2f,%0.2f\n', WeiName, DevName, TYPE, k, TrainError, TestError);
end
end
fclose(fid);
end

