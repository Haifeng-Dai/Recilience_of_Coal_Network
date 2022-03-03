function A_Matrix = Net_Modular(N,n,p,p_g)

n_g = N / n;
A_L = cell(n_g,1);

for i = 1 : n_g
    B = Net_ER(n,p);
    A_L{i} = B;
end

A = [];
C = A;
for i = 1 : n_g
    B = A_L{i};
    A = blkdiag(A, B);
end

for i = 1 : n_g
    B = ones(n);
    C = blkdiag(C,B);
end
D = triu(ones(N) - C) .* rand(N);
E = triu(triu((D <= p_g)) - C);
E1 = (E .* rand(N)) >= 0.5;
E2 = (E - E1)';
A_Matrix = A + E1 + E2;