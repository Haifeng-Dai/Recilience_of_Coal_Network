function ER_fw

clear; clc; rng('default'); rng(0); tic; close all; load('./Data/Data_Fig2a.mat','x3','eta')

N = 100;
p = 0.1;
mu = 1;
MaxPer = 1;
theta = 0.95;
PerStep = 0.02;
Step = MaxPer / PerStep + 1;
loop = 5;
x0h = ones(N,1) * 2;
Data = zeros(loop, Step, 5);

parfor i = 1 : loop
    A = 1 * Net_ER(N,p);
    A0 = normrnd(mu, (mu / 5), [N, N]) .* A;
    Datatemp = zeros(Step, 5);
    for j = 1 : Step
        A1 = (-PerStep + j * PerStep) * A0;
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,100],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = (1 - theta) * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = (j-1) * PerStep;
        Datatemp(j,1) = subs(x3,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
t = toc;
disp(t)
save('.\Data\Data_ER_fw.mat')