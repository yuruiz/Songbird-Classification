function Theta=difficulty(C)
% This code used to compute Difficulty diversity between more than two classifiers
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


P=zeros(2,4);
for i=1:m
   P(1,1+Nt(i,1))=P(1,1+Nt(i,1)) +1;
    
end

P=P/10;
for i=1:size(P,2)
   P(2,i)=(i-1)/L; 
end

Pm=0;
for i=1:size(P,2)
   Pm=Pm+P(1,i)*P(2,i); 
end



Theta=0;
for i=1:(L+1)
    Theta=Theta+((P(2,i)-Pm)^2)*P(1,i);
end
