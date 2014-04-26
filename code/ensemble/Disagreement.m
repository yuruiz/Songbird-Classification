function D=Disagreement(C1,C2)
%Disagreement test used Pairwise classifiers
% C1 is the labels of thhe first class (Column)
% C2 is the labels of thhe second class(Column)
% T is the true labels (Column)

% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638

m=size(C1,1);
n=0;
for i=1:m
    if(C1(i,1) != C2(i,1))
        n=n+1;
    end
end

D=n/m;
