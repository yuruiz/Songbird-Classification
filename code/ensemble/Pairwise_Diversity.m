function D=Pairwise_Diversity(C, PairDiversity)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

L=size(C,2);

S=0;
Counter=0;
for i=1:L
   for j=i:L
      if(i==j) 
          continue;
      end
    S += PairDiversity(C(:,i),C(:,j));      
    Counter++;
   end
end

D=S/Counter;
