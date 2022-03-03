function SF21

clear; clc; rng('default'); rng(0); close all; tic;
load('./Data/Data_Fig2a.mat', 'eta', 'x_high');

N = 500:50:2000;
mu = 1;
KL = 0.2;
x_axis = length(N);
loop = 50;
theta = 0.95;
Data = zeros(x_axis,loop,4);
rd = 2.1;

parfor i = 1:x_axis
    Datatemp = zeros(loop, 4);
    x0h = ones(N(i),1) * 2;
    for j = 1:loop
        A = KL * Net_SF(N(i),rd) .* normrnd(mu, (mu / 5), [N(i), N(i)]);
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
save('./Data/Data_SF2.1.mat')