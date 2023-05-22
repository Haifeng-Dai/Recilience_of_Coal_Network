function Empirical_fn_scale_low

clear; clc; rng('default'); rng(0); close all; tic;

load('./Data/Data_Empirical.mat', 'C')
load('./Data/Data_Fig2a.mat', 'eta', 'x_high');

N = size(C,1);
loop = 5;
Step = 99;
Data = zeros(loop,Step,5);

parfor i = 1 : loop
    Datatemp = zeros(Step, 5);
    A = 0.2 * normrnd(1, (1 / 5), [N, N]) .* C;
    for j = 1 : Step
        A1 = function_delet_nodes(A, j, 0);
        x0h = ones(size(A1,1), 1) * 2;
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,200],x0h);
        xh_ss = xh(end,:)';
        Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = 0.05 * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = j;
        Datatemp(j,1) = subs(x_high,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data);
t = toc;
disp(t)
save('./Data/Data_Empirical_fn_scale_low.mat')