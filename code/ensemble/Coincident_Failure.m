function  CFD=Coincident_Failure(C,T);
% This code used to compute Coincident Failure diversity between more than two
% classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)


Nt=zeros(size(C,1),1);

for i=1:size(C,1)
   for j=1:size(C,2)
     if(C(i,j)==T(i,1))
         Nt(i,1)=Nt(i,1)+1;
     end
   end
end


P=zeros(2,(size(C,2)+1));
for i=1: size(C,1)
   P(1,1+Nt(i,1))=P(1,1+Nt(i,1)) +1;
end

P=P/10;

for i=1:size(P,2)
   P(2,i)=(i-1)/size(C,2); 
end





Y=zeros(1,size(C,2)+1);
Pr=zeros(1,size(C,2)+1);

for i=1:size(P,2)
   Y(1,i)=1-P(2,(size(P,2)+1)-i);
   Pr(1,i)=P(1,(size(P,2)+1)-i);
end


CFD1=1/(1-Pr(1,1));
CFD=0;
for i=1: (size(C,2))
   CFD=CFD+((size(C,2)-i) /(size(C,2)-1))*Pr(1,i+1);
end
CFD=-CFD1*CFD;

