close all; clear; clc; rng('default'); rng(0); tic;

load('Data\Data_Fig2a.mat', 't_low_high', 'x_low_high', 't_lin', 'x_low_lin', 'x_high_lin', 'eta_eff_c')

t_0 = linspace(0, 1, 100);
x_0 = zeros(100, 1);

Fig = figure('Name','R_eff vs eta_eff','NumberTitle','off');

patch(t_low_high, x_low_high, [190 184 220]/255, LineStyle='none'); hold on
patch(t_lin, x_high_lin, [190 184 220]/255, LineStyle='none'); hold on
patch(t_lin, x_low_lin, [231 218 210]/255, LineStyle='none'); hold on
patch([eta_eff_c 1 1 eta_eff_c], [-0.05 -0.05 1.1 1.1], [231 218 210]/255, LineStyle='none'); hold on
% line1 = fplot(x_0,[0,1],'-',Color=[0.4940 0.1840 0.5560],LineWidth=2,DisplayName='\it Depleted'); hold on
% line2 = fplot(x_high,[0,1],'-',Color=[47 127 193]/255,LineWidth=2,DisplayName='\it Sustainable'); hold on
% line3 = fplot(x_low,[0,1],'--',Color=[73 108 136]/255,LineWidth=2,DisplayName='\it Unstable');
line1 = plot(t_0, x_0,'-',Color=[0.4940 0.1840 0.5560],LineWidth=3,DisplayName='\it Depleted'); hold on
line2 = plot(t_lin(1:end-2), x_high_lin(1:end-2), '-', Color=[47 127 193]/255,LineWidth=3,DisplayName='\it Sustainable'); hold on
line3 = plot(t_lin(1:end-2), x_low_lin(1:end-2),'--',Color=[73 108 136]/255,LineWidth=3,DisplayName='\it Unstable'); hold on;
line([eta_eff_c,eta_eff_c],[-0.05,1.1],'LineStyle','--','LineWidth',3,'Color','0.65,0.65,0.65');
legend([line2 line3, line1], Position=[0.610,0.231,0.281,0.187],Box='off');
ylim([-0.05,1.1]); xlabel('\it \eta_{eff}'); ylabel('\it R_{eff}');

annotation('arrow',[0.23,0.23],[0.9,0.83],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.9,0.8],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.9,0.76],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.87,0.7],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);

annotation('arrow',[0.23,0.23],[0.4,0.8],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.4,0.76],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.415,0.715],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.44,0.65],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);

annotation('arrow',[0.23,0.23],[0.34,0.26],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.32,0.32],[0.36,0.26],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.42,0.42],[0.37,0.26],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);
annotation('arrow',[0.53,0.53],[0.38,0.26],'HeadLength',8,'HeadWidth',8,'color','k','LineWidth',0.5);

set(gca,'FontSize',18,'FontName','Times New Roman');

saveas(Fig,'Fig2a','epsc'); % saveas(Fig,'Fig2a');

% saveas(Fig,'./Figure/Fig2a','epsc'); saveas(Fig,'./Figure/Fig2a');
% close all