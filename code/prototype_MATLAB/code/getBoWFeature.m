function [ h ] = getBoWFeature(wordMap, dictionarySize)
%GETIMAGEFEATURES Summary of this function goes here
%   wordMap: size WxM
%   h: size 1 by dictionarySize, and is L1 normalized!

h = zeros(1,dictionarySize);

uq = unique(wordMap);
for k = 1:length(uq)
    w = uq(k);
    h(w) = length(find(wordMap == w));
end

% L1 normalize
h = h/sum(h);

end

