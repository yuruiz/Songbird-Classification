function [value,vote] = majority(t1,w);
% MAJORITY: returns (weighted) majority vote
% [value,vote] = majority(t1[,w])
%	t1    - the data
%                if vector, returns scalar
%                if matrix, returns row vector (i.e. majority over columns)
%	w     - the weight vector, if omitted equal weights
%	value - the result (e.g. majority([1 1 2 3]) = 1)
%	vote  - the vote supporting the result (for above example, vote = 2)

% Copyright (c) 1995-1996 Frank Dellaert
% All rights Reserved

[d,n] = size(t1);

if(d==1)
  % vector
  if (nargin==1), w=ones(1,n); end
  [value,vote] = majority1(t1,w);
else
  % matrix, do all rows
  if (nargin==1), w=ones(1,d); end
  value = zeros(1,n);
  vote = zeros(1,n);
  for i=1:n
    [value(i),vote(i)] = majority1(t1(:,i)',w);
  end
end