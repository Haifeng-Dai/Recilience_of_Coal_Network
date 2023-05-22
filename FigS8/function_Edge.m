function A = function_Edge(A,n)
% A = Net_ER(10,0.1); n = 0.5; C = A;

N = size(A,1); A = triu(A);
B = reshape(A,[N^2,1]);
EdgeIndex = find(B ~= 0);
EdgeNum = length(EdgeIndex);
EdgeDelNum = fix(EdgeNum * n);
EdgeDelIndex = randperm(EdgeNum,EdgeDelNum);
B(EdgeIndex(EdgeDelIndex)) = 0;
B = reshape(B,[N,N]);
A = B + B';