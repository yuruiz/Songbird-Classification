function [C, T, indices] = LoadInputs(dataTag)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 25, 2014

fprintf('Loading %s data...\n', dataTag);
cname = sprintf('data/%s.data', dataTag);
C = load(cname);

fprintf('Loading %s labels...\n', dataTag);
tname = sprintf('data/%s.label', dataTag);
T = load(tname);

fprintf('Loading %s classifer indices...\n', dataTag);
iname = sprintf('data/%s.ind', dataTag);
indices = load(iname);
end

