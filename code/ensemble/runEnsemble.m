% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

clear;

DevName = 'Basic';

DevName = 'Disagreement';
TYPE=3;

DevName = 'Correlation';
DevName = 'Q_Test';
DevName = 'Double_Fault';
TYPE=2;

DevName = 'Interrater_k';
TYPE=0;

k=5;

WeiName = 'PerformanceWeighting';

trainEnsemble(WeiName, DevName, TYPE, k);
testEnsembleTag(WeiName, DevName, TYPE, k, 'train');
testEnsembleTag(WeiName, DevName, TYPE, k, 'test');

