function k=Kohavi_Wolpert(C)
% This code used to compute Kohavi Wolpert diversity between more than two
% classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)

L=size(C,2); 
k=(L-1)*Convert_To_Pair_Disagreement(C)/(2*L);