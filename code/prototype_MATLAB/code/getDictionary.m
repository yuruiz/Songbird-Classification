function [ dictionary ] = getDictionary( allPaths )
%GETDICTIONARY Summary of this function goes here
%   Detailed explanation goes here

% params
K = 200; % 200 as suggested in http://www.di.ens.fr/willow/pdfs/cvpr06b.pdf
% alpha = 10; 
alpha = 0.3; % sample ratio;

% set random seed
s = RandStream('mcg16807','Seed',0);
RandStream.setGlobalStream(s);

filterResponses = [];
for k = 1:length(allPaths)
%     k
    path = allPaths{k};
    % output is NxM matrix, N is the # of time frames, M is dimension of features
    [tmp] = extractFilterResponses(path);
    tmp = tmp(randperm(size(tmp,1),round(size(tmp,1)*alpha)),:);    
    filterResponses = [filterResponses; tmp];
end

% save tmp filterResponses

[unused, dictionary] = kmeans(filterResponses, K, 'EmptyAction','drop');

end

