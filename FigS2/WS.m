function WS

clear; clc; rng('default'); rng(0); close all; tic;
load('./Data/Data_Fig2a.mat', 'x_high', 'eta')

p = 0.1;
m = 2:2:48;
N = 100;
mu = 1;
KL = 0.2;
x_axis = length(m);
loop = 50;
alpha = 0.5;
c = 0.2;
K = 1;
delta = 1/5;
theta = 0.95;
Data = zeros(x_axis,loop,4);
x0h = ones(N,1) * 2;

parfor i = 1:x_axis
    Datatemp = zeros(loop, 4);
    for j = 1:loop
        A = KL * Net_WS(N,m(i),p) .* normrnd(mu, (mu / 5), [N, N]);
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A),[0,200],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A*xh_ss) / sum(sum(A));
        Datatemp(j,4) = (1 - theta) * sum(sum(A*A)) / sum(sum(A));
        Datatemp(j,1) = subs(x_high,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta);
save('./Data/Data_WS.mat')