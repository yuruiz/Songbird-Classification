function k=Interrater_k(C)
% This code used to compute Interrater coefficient between more than two
% classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)
%
% ------------------------------------------------------------------------
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 25, 2014

m=size(C,1);
L=size(C,2);

P=zeros(1,L);
for i=1:m
   for j=1:L
       if(C(i,j)==1)
            P(1,j)=P(1,j)+1;
       end
   end
end
    
P=P/m;
P=mean(P);
k=1-(Pairwise_Diversity(C, @Disagreement)/((L-1)*P*(1-P)));
