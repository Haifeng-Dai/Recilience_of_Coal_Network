function ER_fn_Random

clear; clc; rng('default'); rng(0); tic; close all; load('./Data/Data_Fig2a.mat','x3','eta')

N = 100;
p = 0.1;
Per = 0.8;
loop = 5;
theta = 0.95;
x0hn = ones(N,1) * 2;
Step = fix(N * Per) + 1;
Data = zeros(loop,Step,5);

parfor i = 1 : loop
    Datatemp = zeros(Step, 5);
    A = 0.2 * normrnd(1, (1 / 5), [N, N]) .* Net_ER(N,p);
    for j = 1 : Step
        n = N - j + 1;
        [A1,x0h] = function_Node(A,1,n,x0hn);
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,200],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = (1 - theta) * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = 1 - n / N;
        Datatemp(j,1) = subs(x3,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
t = toc;
disp(t)
save('.\Data\Data_ER_fn_Random.mat')