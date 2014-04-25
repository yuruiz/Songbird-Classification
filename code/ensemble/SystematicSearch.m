function maxIndices = SystematicSearch(C, T, DevMethod, TYPE)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

L=size(C, 2);

#Systematic Search
binFlags=zeros(1,L);
maxDV = 0;
while (true) 
  binFlags = IncBinaryArray(binFlags);
  sumV = sum(binFlags);
  if sumV==0
    break;
  end 
  if sumV<2
    continue
  end
  indices = find(binFlags);
  subC = GetSubMatrix(C, indices); 
  dv = GetDiversity(subC, T, DevMethod, TYPE);
  if dv > maxDV
    maxDV = dv;
    maxIndices = indices;
  end
endwhile
  
end
