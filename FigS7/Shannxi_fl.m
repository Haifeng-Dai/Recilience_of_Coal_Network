function Shannxi_fl

clear; clc; rng('default'); rng(0); tic; load('./Data/Data_Fig2a.mat', 'eta', 'x3'); load('./Data/Data_Empirical.mat', 'C');

C = C(76:100,76:100);
N = size(C,1); MaxPer = 0.8; loop = 5; x0h = ones(N,1) * 2;
Step = MaxPer/0.01 + 1; Data = zeros(loop,Step,5);

parfor i = 1 : loop
    Datatemp = zeros(Step, 5); A = 0.2 * normrnd(1, (1 / 5), [N, N]) .* C;
    for j = 1 : Step
        DelEdgePer = (j - 1) / 100;
        A1 = function_Edge(A,DelEdgePer);
        [~,xh] = ode45(@(t,xh) function_Dynamic(t,xh,A1),[0,100],x0h);
        xh_ss = xh(end,:)'; Datatemp(j,2) = mean(xh_ss);
        Datatemp(j,3) = sum(A1*xh_ss) / sum(sum(A1));
        Datatemp(j,4) = 0.05 * sum(sum(A1*A1)) / sum(sum(A1));
        Datatemp(j,5) = DelEdgePer;
        Datatemp(j,1) = subs(x3,eta,Datatemp(j,4));
    end
    Data(i,:,:) = Datatemp;
end

[D1,D2,D3] = size(Data); t = toc; disp(t); save ./Data/Data_Shannxi_fl