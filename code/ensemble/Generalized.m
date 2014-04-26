function GD=Generalized(C)
% This code used to compute Generalize diversity between more than two
% classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)

m = size(C,1);
L = size(C,2);
Nt=zeros(m,1);


for i=1:m
   for j=1:L
     if(C(i,j)==1)
         Nt(i,1)=Nt(i,1)+1;
     end
   end
end


P=zeros(3,(L+1));
for i=1: m
   P(1,1+Nt(i,1))=P(1,1+Nt(i,1)) +1;
    
end

P=P/10;

for i=1:size(P,2)
   P(2,i)=(i-1)/L; 
end


for i=2:size(P,2)
   P(3,i)=(i-2)/(L-1) ;
end



Y=zeros(1,L+1);
Y2=zeros(1,L+1);
Pr=zeros(1,L+1);

for i=1:size(P,2)
   Y(1,i)=1-P(2,(size(P,2)+1)-i);
   Pr(1,i)=P(1,(size(P,2)+1)-i);
   Y2(1,i)=P(3,i);
  
end


P1=0;
for i=1:size(P,2)
   P1=P1+Y(1,i)*Pr(1,i); 
end


P2=0;
for i=2:size(P,2)
   P2=P2+Y(1,i)*Pr(1,i)*Y2(1,i); 
end

GD=1-(P2/P1);
