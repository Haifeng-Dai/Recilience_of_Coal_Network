clear; clc; rng('default'); rng(0); tic;

t = 100; S =  100; pr = 0.1 : 0.1 : 0.9;
pl = length(pr); L = 1; dt = t / L; loop = 50;
x = zeros(S,L); eta_eff = zeros(loop,1); pro = zeros(pl,1);
KL = 0.2; alpha = 0.5; c = 0.2; K = 1; delta = 1/5; theta = 0.95; mu = 1;

eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta);

for i = 1 : pl
    for j = 1:loop
        A = KL * Net_ER(S,pr(i)) .* normrnd(mu, (mu / 5), [S, S]);
        beta_eff = (sum(A) * sum(A,2)) / (sum(sum(A)));
        eta_eff(j) = beta_eff - theta * beta_eff;
    end
    pro(i) = sum(abs(eta_eff) <= eta_eff_c) / loop;
end

save ./Data/Fig2c.mat

Fig = figure('Name','Probability vs Connectivity','NumberTitle','off');
h1 = plot(pr,pro,'.','MarkerSize',20,'DisplayName','Numerical'); hold on
h2 = line([0,eta_eff_c],[1,1],'LineWidth',2,'Color','#D95319','DisplayName','Theoretical'); hold on
line([eta_eff_c,eta_eff_c],[0,1],'LineWidth',2,'Color','#D95319'); hold on
line([eta_eff_c,1],[0,0],'LineWidth',2,'Color','#D95319');
legend([h1,h2],'Location','southwest')
xlabel('Connectivity'); ylabel('Probability'); xlim([0.1 0.9]); ylim([-0.1,1.1]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0.1,0.3,0.5,0.7,0.9]);

saveas(Fig,'./Figure/Fig2c','epsc'); saveas(Fig,'./Figure/Fig2c');
% close all