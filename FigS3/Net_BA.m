function A = Net_BA(N,m)

m0 = m; A = zeros(N,N);

if m == 1
    m0 = 2;
    A(1,2) = 1;
    A(2,1) = 1;
else
    AIniteial = triu(ones(m0),1);
    A(1:m0,1:m0) = AIniteial + AIniteial';
end

for i = m0+1 : N
    DegVec = sum(A(1:i-1, 1:i-1));
    ConPro = cumsum(DegVec) / sum(DegVec);
    ProDis = [0, ConPro];
    NewEdge = 0;
    while NewEdge < m
        RanNum = rand(1);
        for j = 1 : i - 1
            if A(i,j) == 0 && RanNum >= ProDis(j) && RanNum < ProDis(j+1)
                A(i,j) = 1;
                A(j,i) = 1;
                NewEdge = NewEdge + 1;
            end
        end
    end
end