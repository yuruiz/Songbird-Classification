% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

clear;

DevName = 'Basic';

DevName = 'Disagreement';
TYPE=3;

DevName = 'Q_Test';
DevName = 'Correlation';
DevName = 'Double_Fault';
TYPE=2;

k=6;

WeiName = 'PerformanceWeighting';

trainEnsemble(WeiName, DevName, TYPE, k);
testEnsemble(WeiName, DevName, TYPE, k);

