clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

% ER; ER_LowInitial

load ./Data/Data_ER.mat; Reff = Data(:,:,3);
% etaeff = Data(:,:,4);
R = Data(:,:,1);
ReffMean1 = mean(Reff,2); ReffMax = max(Reff,[],2); ReffMin = min(Reff,[],2);
ErrorUpReff1 = ReffMax - ReffMean1; ErrorDownReff1 = ReffMean1 - ReffMin;
% etaeffMean = mean(etaeff,2); etaeffMax = max(etaeff,[],2); etaeffMin = min(etaeff,[],2);
% ErrorUpeta = etaeffMax - etaeffMean; ErrorDowneta = etaeffMean - etaeffMin;
RMean1 = mean(R,2); RMax = max(R,[],2); RMin = min(R,[],2);
ErrorUpR1 = RMax - RMean1; ErrorDownR1 = RMean1 - RMin;
RMean1(14:17) = 0; ErrorUpR1(14:17) = 0; ErrorDownR1(14:17) = 0;

load ./Data/Data_ER_LowInitial.mat; Reff = Data(:,:,3); etaeff = Data(:,:,4); R = Data(:,:,1);
ReffMean2 = mean(Reff,2); ReffMax = max(Reff,[],2); ReffMin = min(Reff,[],2);
ErrorUpReff2 = ReffMax - ReffMean2; ErrorDownReff2 = ReffMean2 - ReffMin;
etaeffMean = mean(etaeff,2); etaeffMax = max(etaeff,[],2); etaeffMin = min(etaeff,[],2);
ErrorUpeta = etaeffMax - etaeffMean; ErrorDowneta = etaeffMean - etaeffMin;
RMean2 = mean(R,2); RMax = max(R,[],2); RMin = min(R,[],2);
ErrorUpR2 = RMax - RMean2; ErrorDownR2 = RMean2 - RMin;
RMean2(14:17) = 0; ErrorUpR2(14:17) = 0; ErrorDownR2(14:17) = 0;

eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta) * ones(x_axis,1);

Fig1 = figure('Name','R_{eff} vs Conneivity','NumberTitle','off');
errorbar(p,ReffMean1,ErrorDownReff1,ErrorUpReff1,'--o','MarkerSize',6,'LineWidth',2,'DisplayName','Numerical with high initial state'); hold on
errorbar(p,ReffMean2,ErrorDownReff2,ErrorUpReff2,'--o','MarkerSize',6,'LineWidth',2,'DisplayName','Numerical with high low state'); hold on
errorbar(p,RMean1,ErrorDownR1,ErrorUpR1,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','Theoretical with high initial state'); hold on
% errorbar(p,RMean2,ErrorDownR2,ErrorUpR2,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','\it Theoretical');
legend('Location','Best','FontSize',14,'Position',[0.163579756656194,0.329166667503647,0.546428557857871,0.169047614364397])
xlabel('Conneivity'); ylabel('R_{eff}'); xlim([0.1,0.9]);
ylim([-0.1,1])
set(gca,'FontSize',18,'FontName','Arial','XTick',[0.1,0.3,0.5,0.7,0.9])

Fig2 = figure('Name','eta_{eff} vs Conneivity','NumberTitle','off');
errorbar(p,etaeffMean,ErrorDowneta,ErrorUpeta,'-o','MarkerSize',6,'LineWidth',2); hold on;
plot(p,eta_eff_c,'--','LineWidth',2);
text(0.17,0.85,'Critical Value','FontSize',18,'FontName','Arial','Color','#D95319')
xlabel('Conneivity'); ylabel('\eta_{eff}'); xlim([0.1,0.9]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0.1,0.3,0.5,0.7,0.9])

saveas(Fig1,'./Figure/FigS1a','epsc'); saveas(Fig1,'./Figure/FigS1a');
saveas(Fig2,'./Figure/FigS1b','epsc'); saveas(Fig2,'./Figure/FigS1b');