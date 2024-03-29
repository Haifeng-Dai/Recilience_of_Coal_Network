function BA_LowInitial

clear; clc; rng('default'); rng(0); tic;
load('./Data/Data_Fig2a.mat','x_high','eta')

m = 2:2:80;
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
x0h = ones(N,1) * 0.1;

parfor i = 1:x_axis
    Datatemp = zeros(loop, 4);
    for j = 1:loop
        A = KL * Net_BA(N, m(i)) .* normrnd(mu, (mu / 5), [N, N]);
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
save('./Data/Data_BA_LowInitial.mat')