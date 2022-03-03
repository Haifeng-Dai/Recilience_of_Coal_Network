function Modular_10

clear; clc; rng('default'); rng(0); close all; tic; load('./Data/Data_Fig2a.mat','x3','eta')

p = 0.1:0.05:0.9;
N = 100;
mu = 1;
KL = 0.2;
x_axis = length(p);
loop = 50;
theta = 0.95;
Data = zeros(x_axis,loop,4);
x0h = ones(N,1) * 2;

parfor i = 1:x_axis
    Datatemp = zeros(loop, 4);
    for j = 1:loop
        A = KL * Net_Modular(N, N/10, p(i), 0.1) .* normrnd(mu, (mu / 5), [N, N]);
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A),[0,200],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A*xh_ss) / sum(sum(A));
        Datatemp(j,4) = (1 - theta) * sum(sum(A*A)) / sum(sum(A));
        Datatemp(j,1) = subs(x3,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
save('./Data/Data_Modular_10.mat')