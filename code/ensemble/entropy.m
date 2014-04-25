function E=entropy(C);
% This code used to compute Entropy diversity between more than two classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represents number of objects, N represents number of
% classifiers, T is the labels of the objects (0 represents  false, 1 true)



Nts=size(C,1);
L=size(C,2);
Nt=0;
Nf=0;
S=0;
for i=1:size(C,1)
    for j=1:size(C,2)
        if(C(i,j)==1)
            Nt=Nt+1;
        else
            Nf=Nf+1;
        end 
    end
    A=min(Nt,Nf)
    S=S+A;
    Nt=0;
    Nf=0;

end


E=(1/Nts)*(2/(L-1))*(S);