function [ wordMap ] = getWordMap(path, dictionary)
%GETVISUALWORDS Summary of this function goes here
%   wordMap: size same as I (no third dimension), each pixel assigned to a dictionary


[filterResponses, invalid] = extractFilterResponses(path);

if invalid
    wordMap = [];
else
    Dist = pdist2(filterResponses, dictionary);
    [~, wordMap]=min(Dist,[],2);
end

end

