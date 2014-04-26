function P=Correlation(C1,C2)
%Correlation test used Pairwise classifiers
% C1 is the labels of thhe first class (Column)
% C2 is the labels of thhe second class(Column)
% T is the true labels (Column)

% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638

a=0;
b=0;
c=0;
d=0;
for i=1:size(C1,1)
    if(C2(i,1)==1 && C1(i,1)==1)
        a=a+1;
    end
    
    if(C1(i,1)==0 && C2(i,1)==0)
        d=d+1;
    end
    
    if(C1(i,1)==1 && C2(i,1)==0)
        b=b+1;
    end
    
    if(C1(i,1)==0 && C2(i,1)==1)
        c=c+1;
    end
end

P=(a*d-b*c)/sqrt((a+b)*(a+c)*(b+d)*(c+d));

