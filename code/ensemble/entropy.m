function E=entropy(C);
% This code used to compute Entropy diversity between more than two classifiers
% This code implemented by Eng. Alaa Tharwat Abd El Monaaim - Egypt- TA in
% El Shorouk Academy
% engalaatharwat@hotmail.com  +201006091638
%
% C (MxN) M represem number of objects, N represem number of
% classifiers, T is the labels of the objects (0 represem  false, 1 true)



m=size(C,1);
L=size(C,2);
Nt=0;
Nf=0;
S=0;
for i=1:m
    for j=1:L
        if(C(i,j)==1)
            Nt++;
        else
            Nf++;
        end 
    end
    A=min(Nt,Nf);
    S=S+A;
    Nt=0;
    Nf=0;

end


E=(1/m)*(2/(L-1))*(S);
