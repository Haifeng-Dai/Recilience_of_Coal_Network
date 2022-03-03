function f = function_Dynamic(~,x,A)

alp = 0.5;
c = 0.2;
K = 1;
theta = 0.95;
delta = 1/5;
 N = size(A,1); 

f = alp * x .*(1 - x / K).*(x - c);
for i = 1 : N
    for j = 1 : N
        f(i) = f(i) - (1 - theta) * delta * A(i,j) * x(i) * x(j);
    end
end