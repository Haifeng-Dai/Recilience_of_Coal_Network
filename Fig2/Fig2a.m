clear; clc; rng('default'); rng(0); tic;

syms x eta

% alpha = 0.04; c = 0.8; K = 0.1; delta = 1/5;
alpha = 0.5; c = 0.2; K = 1; delta = 1/5;
eqn = alpha * x * (x - c) * (1 - x / K) - delta * eta * x^2;
solution = solve(eqn);

x_0 = solution(1); x_low = solution(2); x_high = solution(3);
eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta);
R_eff_c = double(subs(x_low, eta_eff_c));

t_lin = linspace(0, eta_eff_c, 1e3); x_low_lin = zeros(1,length(t_lin)); x_high_lin = x_low_lin;
for i = 1:length(t_lin)
    x_low_lin(i) = double(subs(x_low, t_lin(i)));
    x_high_lin(i) = double(subs(x_high, t_lin(i)));
end
x_low_lin(end+1) = -0.05; x_low_lin(end+1) = -0.05;
x_high_lin(end+1) = 1.1; x_high_lin(end+1) = 1.1;
t_lin(end+1) = t_lin(end); t_lin(end+1) = 0;
t_low_high = [t_lin(1:end-2), t_lin(end-2:-1:1)];
x_low_high = [x_low_lin(1:end-2), x_high_lin(end-2:-1:1)];

save ./Data/Data_Fig2a.mat

Fig = figure('Name','R_eff vs eta_eff','NumberTitle','off');

patch(t_low_high, x_low_high, [190 184 220]/255, LineStyle='none'); hold on
patch(t_lin, x_high_lin, [190 184 220]/255, LineStyle='none'); hold on
patch(t_lin, x_low_lin, [231 218 210]/255, LineStyle='none'); hold on
patch([eta_eff_c 1 1 eta_eff_c], [-0.05 -0.05 1.1 1.1], Color=[231 218 210]/255, LineStyle='none'); hold on
line1 = fplot(x_0,[0,1],'-','LineWidth',2,'DisplayName','\it Sustainable'); hold on
line2 = fplot(x_low,[0,1],'--','LineWidth',2,'DisplayName','\it Unstable'); hold on
line3 = fplot(x_high,[0,1],'-','LineWidth',2,'DisplayName','\it Depleted');
legend([line1 line2 line3], 'Location','northeast');
ylim([-0.05,1.1]); xlabel('\it \eta_{eff}'); ylabel('\it R_{eff}');

annotation('arrow',[0.23,0.23],[0.9,0.83],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.9,0.8],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.9,0.76],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.87,0.7],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);

annotation('arrow',[0.23,0.23],[0.4,0.8],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.4,0.76],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.415,0.715],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.44,0.65],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);

annotation('arrow',[0.23,0.23],[0.34,0.26],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.36,0.26],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.37,0.26],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.38,0.26],'HeadLength',8,'HeadWidth',5,'color','k','LineWidth',0.5);

% set(gca,'FontSize',18,'FontName','Times New Roman');

saveas(Fig,'./Figure/Fig2a','epsc'); saveas(Fig,'./Figure/Fig2a');
% close all