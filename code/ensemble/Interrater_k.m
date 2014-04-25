function k=Interrater_k(C)
% This code used to compute Interrater coefficient between more than two
% classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)

P=zeros(1,size(C,2));
for i=1:size(C,1)
   for j=1:size(C,2)
       if(C(i,j)==1)
            P(1,j)=P(1,j)+1;
       end
   end
end
    
P=P/(size(C,1));
P=mean(P);
k=1-(Convert_To_Pair_Disagreement(C,T)/((size(C,2)-1)*P*(1-P)));