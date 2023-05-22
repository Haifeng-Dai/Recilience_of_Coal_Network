function WS_Pro

clear; clc; rng('default'); rng(0); close all; tic;

p = 0.1;
m = 2:2:48;
N =  100;
pl = length(m);
loop = 50;
connectivity = 2*m/(N-1);
critical_pro = 0.7636;
eta_eff = zeros(loop,1);
pro = zeros(pl,1);
KL = 0.2;
alpha = 0.5;
c = 0.2;
K = 1;
delta = 1/5;
theta = 0.95;
mu = 1;

eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta);

for i = 1 : pl
    for j = 1:loop
        A = KL * Net_WS(N,m(i),p) .* normrnd(mu, (mu / 5), [N, N]);
        beta_eff = (sum(A) * sum(A,2)) / (sum(sum(A)));
        eta_eff(j) = beta_eff - theta * beta_eff;
    end
    pro(i) = sum(abs(eta_eff) <= eta_eff_c) / loop;
end

save('.\Data\Data_FigS2b.mat')