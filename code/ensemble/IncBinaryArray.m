function binFlags = IncBinaryArray(binFlags)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014

L=length(binFlags);
for i=1:L
  if binFlags(i)==1
    binFlags(i)=0;
  else 
    binFlags(i)=1;
   break
end
  
end
