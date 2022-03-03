function Shannxi_fn_Low

clear; clc; rng('default'); rng(0); tic; load('./Data/Data_Fig2a.mat', 'eta', 'x_high'); load('./Data/Data_Empirical.mat', 'C');

C = C(76:100,76:100);
A = C;
alpha = 0.5; c = 0.2; K = 1; delta = 0.2; theta = 0.95;
N = size(A,1); Per = 0.8; loop = 5;
x0hn = ones(N,1) * 2;
Step = fix(N * Per) + 1; Data = zeros(loop,Step,5);

parfor i = 1 : loop
    Datatemp = zeros(Step, 5); A0 = 0.2 * normrnd(1, (1 / 5), [N, N]) .* A;
    for j = 1 : Step
        n = N - j + 1;
        [A1,x0h] = function_Node(A0,2,n,x0hn);
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,100],x0h);
        xh_ss = xh(end,:)'; Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = (1-theta) * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = 1 - n / N;
        Datatemp(j,1) = subs(x_high,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data); t = toc; save ./Data/Data_Shannxi_fn_Low