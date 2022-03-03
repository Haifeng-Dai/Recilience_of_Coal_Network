function Empirical_fw_low

clear; clc; rng('default'); rng(0); close all; tic;

load('./Data/Data_Empirical.mat', 'C')
load('./Data/Data_Fig2a.mat', 'eta', 'x_high')
N = size(C,1);
MaxPer = 1;
theta = 0.95;
PerStep = 0.02;
Step = (MaxPer - 0.2) / PerStep + 1;
loop = 5;
x0h = ones(N,1) * 0.2;
Data = zeros(loop, Step, 5);

parfor i = 1 : loop
    A = 1.5 * normrnd(1, (1 / 5), [N, N]) .* C;
    Datatemp = zeros(Step, 5);
    for j = 1 : Step
        A1 = (j * PerStep) * A;
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,100],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = (1 - theta) * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = (j-1) * PerStep;
        Datatemp(j,1) = subs(x_high,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
t = toc; disp(t)
save('./Data/Data_Empirical_fw_Low.mat')