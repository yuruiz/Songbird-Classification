function [value,vote] = majority1(t1,w);
% MAJORITY1: returns weighted majority vote for a *row vector*
% [value,vote] = majority1(t1,w)
%	t1    - the data, *must be a row vector*
%	w     - the weight vector, if omitted equal weights
%	value - the result (e.g. majority([1 1 2 3]) = 1)
%	vote  - the vote supporting the result (for above example, vote = 2)

% Copyright (c) 1995-1996 Frank Dellaert
% All rights Reserved

[d,n] = size(t1);
if (nargin==1), w=ones(1,n); end

if(d~=1), error('row vectors only !'); end

a = min(t1);
b = max(t1);
index = 0;
value = 0;
vote=0;
for i=a:b,
  myvote = sum((t1==i).*w);
  if (myvote>vote), vote=myvote; value=i; end
end
