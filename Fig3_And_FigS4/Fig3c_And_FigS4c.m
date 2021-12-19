clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

% ER_fw;

load ./Data/Data_ER_fw.mat; Reff(1:D1,1:D2) = Data(:,:,3); etaeff = Data(:,:,4); R = Data(:,:,1);
ReffMean = mean(Reff); ReffMax = max(Reff); ReffMin = min(Reff);
ErrorUpReff = ReffMax - ReffMean; ErrorDownReff = ReffMean - ReffMin;
etaeffMean = mean(etaeff); etaeffMax = max(etaeff); etaeffMin = min(etaeff);
ErrorUpeta = etaeffMax - etaeffMean; ErrorDowneta = etaeffMean - etaeffMin;
RMean = mean(R); RMax = max(R); RMin = min(R);
ErrorUpR = RMax - RMean; ErrorDownR = RMean - RMin;
WightRate = MaxPer - Data(1,:,5); n = 2;
% RMean(13:17) = 0; ErrorUpR(13:17) = 0; ErrorDownR(13:17) = 0;
WightRate = WightRate(1:n:end);
ReffMean = ReffMean(1:n:end); ErrorDownReff = ErrorDownReff(1:n:end); ErrorUpReff = ErrorUpReff(1:n:end);
RMean = RMean(1:n:end); ErrorDownR = ErrorDownR(1:n:end); ErrorUpR = ErrorUpR(1:n:end);
etaeffMean = etaeffMean(1:n:end); ErrorDowneta = ErrorDowneta(1:n:end); ErrorUpeta = ErrorUpeta(1:n:end);

Fig1 = figure('Name','R_{eff} vs f_w','NumberTitle','off');
errorbar(WightRate,ReffMean,ErrorDownReff,ErrorUpReff,'--o','MarkerSize',6,'LineWidth',2,'DisplayName','Numerical'); hold on
errorbar(WightRate,RMean,ErrorDownR,ErrorUpR,'-^','MarkerSize',6,'LineWidth',2,'DisplayName','Theroetical');
xlabel('f_w'); ylabel('R_{eff}');
ylim([0, 1]);
legend('Location','southeast');
set(gca,'FontSize',18,'FontName','Arial','XTick',[0,0.2,0.4,0.6,0.8,1])

Fig2 = figure('Name','eta_{eff} vs f_w','NumberTitle','off');
errorbar(WightRate,etaeffMean,ErrorDowneta,ErrorUpeta,'-o','MarkerSize',6,'LineWidth',2);
xlabel('f_w'); ylabel('\eta_{eff}');
% ylim([0,0.15]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0,0.2,0.4,0.6,0.8,1])

saveas(Fig1,'./Figure/Fig3c','epsc'); saveas(Fig1,'./Figure/Fig3c');
saveas(Fig2,'./Figure/FigS4c','epsc'); saveas(Fig2,'./Figure/FigS4c');