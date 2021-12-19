clear; clc; rng('default'); rng(0); tic; load('./Data/Data_Fig2a.mat', 'x1', 'x2', 'x3');

mkdir('./Figure/'); mkdir('./Data/')

% Shanxi_fn_High; Shanxi_fn_Low; Shanxi_fn_Random; Shanxi_fl; Shanxi_fw; Shanxi_fw_low

load ./Data/Data_Shanxi_fw.mat; Reff1 = Data(:,:,3); etaeff1 = Data(:,:,4);
load ./Data/Data_Shanxi_fl.mat; Reff2 = Data(:,:,3); etaeff2 = Data(:,:,4);
load ./Data/Data_Shanxi_fn_High.mat; Reff3 = Data(:,:,3); etaeff3 = Data(:,:,4);
load ./Data/Data_Shanxi_fn_Low.mat; Reff4 = Data(:,:,3); etaeff4 = Data(:,:,4);
load ./Data/Data_Shanxi_fn_Random.mat; Reff5 = Data(:,:,3); etaeff5 = Data(:,:,4);
load ./Data/Data_Shanxi_fw_low.mat; Reff6 = Data(:,:,3); etaeff6 = Data(:,:,4);

Fig = figure('Name','R_eff vs eta_eff','NumberTitle','off');
fplot(x1,[0,1],'-','LineWidth',2,'DisplayName','Sustainable'); hold on
fplot(x2,[0,1],'--','LineWidth',2,'DisplayName','Unstable'); hold on
fplot(x3,[0,1],'-','LineWidth',2,'DisplayName','Depleted');
% legend('Location','northeast');
ylim([-0.05,1.1]); xlabel('\eta_{eff}'); ylabel('R_{eff}');
scatter(etaeff1, Reff1, 18, [0.3010 0.7450 0.9330], 'filled'); hold on
scatter(etaeff5, Reff5, 18, [0.85,0.33,0.10], 'filled'); hold on
scatter(etaeff4, Reff4, 18, [0.93,0.69,0.13], 'filled'); hold on
scatter(etaeff3, Reff3, 18, [0.49,0.18,0.56], 'filled'); hold on
scatter(etaeff2, Reff2, 18, [0.47,0.67,0.19], 'filled'); hold on
scatter(etaeff6, Reff6, 18, [0.6350 0.0780 0.1840], 'filled')
set(gca,'FontSize',18,'FontName','Arial');

saveas(Fig,'./Figure/FigS7a','epsc'); saveas(Fig,'./Figure/FigS7a');