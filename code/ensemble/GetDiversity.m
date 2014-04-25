function dv = GetDiversity(C, T, DevMethod, TYPE)
% Author: Xiao-Feng Xie (xfxie@cs.cmu.edu)
% Created/Modified: Apr 24, 2014
%

  if TYPE==0
    dv = DevMethod(C);
  elseif TYPE==1
    B = ToMBinLabel(C, T);
    dv = DevMethod(B);
  elseif TYPE==2
    B = ToMBinLabel(C, T);
    dv = Pairwise_Diversity(B, DevMethod);
  else 
    dv = Pairwise_Diversity(C, DevMethod);
  end
end

