% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

clear;

DevName = 'Basic';

DevName = 'Disagreement';
TYPE=3;

DevName = 'Double_Fault';
DevName = 'Q_Test';
DevName = 'Correlation';
TYPE=2;

k=6;

WeiName = 'PerformanceWeighting';

trainEnsemble(WeiName, DevName, TYPE, k);
testEnsemble(WeiName, DevName, TYPE, k);

