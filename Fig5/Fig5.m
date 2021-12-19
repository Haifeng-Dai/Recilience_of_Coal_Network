clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

% Modular_2; Modular_4; Modular_5; Modular_10

load ./Data/Data_Modular_2.mat; Reff2 = Data(:,:,3); etaeff2 = Data(:,:,4); R2 = Data(:,:,1);
ReffMean2 = mean(Reff2,2); ReffMax2 = max(Reff2,[],2); ReffMin2 = min(Reff2,[],2);
ErrorUpReff2 = ReffMax2 - ReffMean2; ErrorDownReff2 = ReffMean2 - ReffMin2;
etaeffMean2 = mean(etaeff2,2); etaeffMax2 = max(etaeff2,[],2); etaeffMin2 = min(etaeff2,[],2);
ErrorUpeta2 = etaeffMax2 - etaeffMean2; ErrorDowneta2 = etaeffMean2 - etaeffMin2;
RMean2 = mean(R2,2); RMax2 = max(R2,[],2); RMin2 = min(R2,[],2);
ErrorUpR2 = RMax2 - RMean2; ErrorDownR2 = RMean2 - RMin2;

load ./Data/Data_Modular_4.mat; Reff4 = Data(:,:,3); etaeff4 = Data(:,:,4); R4 = Data(:,:,1);
ReffMean4 = mean(Reff4,2); ReffMax4 = max(Reff4,[],2); ReffMin4 = min(Reff4,[],2);
ErrorUpReff4 = ReffMax4 - ReffMean4; ErrorDownReff4 = ReffMean4 - ReffMin4;
etaeffMean4 = mean(etaeff4,2); etaeffMax4 = max(etaeff4,[],2); etaeffMin4 = min(etaeff4,[],2);
ErrorUpeta4 = etaeffMax4 - etaeffMean4; ErrorDowneta4 = etaeffMean4 - etaeffMin4;
RMean4 = mean(R4,2); RMax4 = max(R4,[],2); RMin4 = min(R4,[],2);
ErrorUpR4 = RMax4 - RMean4; ErrorDownR4 = RMean4 - RMin4;

load ./Data/Data_Modular_5.mat; Reff5 = Data(:,:,3); etaeff5 = Data(:,:,4); R5 = Data(:,:,1);
ReffMean5 = mean(Reff5,2); ReffMax5 = max(Reff5,[],2); ReffMin5 = min(Reff5,[],2);
ErrorUpReff5 = ReffMax5 - ReffMean5; ErrorDownReff5 = ReffMean5 - ReffMin5;
etaeffMean5 = mean(etaeff5,2); etaeffMax5 = max(etaeff5,[],2); etaeffMin5 = min(etaeff5,[],2);
ErrorUpeta5 = etaeffMax5 - etaeffMean5; ErrorDowneta5 = etaeffMean5 - etaeffMin5;
RMean5 = mean(R5,2); RMax5 = max(R5,[],2); RMin5 = min(R5,[],2);
ErrorUpR5 = RMax5 - RMean5; ErrorDownR5 = RMean5 - RMin5;

load ./Data/Data_Modular_10.mat; Reff10 = Data(:,:,3); etaeff10 = Data(:,:,4); R10 = Data(:,:,1);
ReffMean10 = mean(Reff10,2); ReffMax10 = max(Reff10,[],2); ReffMin10 = min(Reff10,[],2);
ErrorUpReff10 = ReffMax10 - ReffMean10; ErrorDownReff10 = ReffMean10 - ReffMin10;
etaeffMean10 = mean(etaeff10,2); etaeffMax10 = max(etaeff10,[],2); etaeffMin10 = min(etaeff10,[],2);
ErrorUpeta10 = etaeffMax10 - etaeffMean10; ErrorDowneta10 = etaeffMean10 - etaeffMin10;
RMean10 = mean(R10,2); RMax10 = max(R10,[],2); RMin10 = min(R10,[],2);
ErrorUpR10 = RMax10 - RMean10; ErrorDownR10 = RMean10 - RMin10;

eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta) * ones(x_axis,1);

Fig1 = figure('Name','R_{eff} vs Connectivity','NumberTitle','off');
errorbar(p,ReffMean2,ErrorDownReff2,ErrorUpReff2,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','2 modules'); hold on
errorbar(p,ReffMean4,ErrorDownReff4,ErrorUpReff4,'--v','MarkerSize',6,'LineWidth',2,'DisplayName','4 modules'); hold on
errorbar(p,ReffMean5,ErrorDownReff5,ErrorUpReff5,'-.*','MarkerSize',6,'LineWidth',2,'DisplayName','5 modules'); hold on
errorbar(p,ReffMean10,ErrorDownReff10,ErrorUpReff10,':s','MarkerSize',6,'LineWidth',2,'DisplayName','10 modules'); hold on
% errorbar(p,RMean,ErrorDownR,ErrorUpR,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','\it Theoretical');
legend('Location','southwest')
xlabel('Local Connectivity'); ylabel('R_{eff}');
xlim([0.1, 0.9])
ylim([0,1]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0.1,0.3,0.5,0.7,0.9])

Fig2 = figure('Name','eta_{eff} vs Connectivity','NumberTitle','off');
p2 = errorbar(p,etaeffMean2,ErrorDowneta2,ErrorUpeta2,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','2 modules'); hold on;
p4 = errorbar(p,etaeffMean4,ErrorDowneta4,ErrorUpeta4,'--v','MarkerSize',6,'LineWidth',2,'DisplayName','4 modules'); hold on;
p5 = errorbar(p,etaeffMean5,ErrorDowneta5,ErrorUpeta5,'-.*','MarkerSize',6,'LineWidth',2,'DisplayName','5 modules'); hold on;
p10 = errorbar(p,etaeffMean10,ErrorDowneta10,ErrorUpeta10,':s','MarkerSize',6,'LineWidth',2,'DisplayName','10 modules'); hold on;
plot(p,eta_eff_c,'--','LineWidth',2,'DisplayName','Critical Value','Color','#D95319');
text(0.17,0.85,'Critical Value','FontSize',18,'FontName','Arial','Color','#D95319')
xlabel('Local Connectivity'); ylabel('\eta_{eff}');
xlim([0.1, 0.9])
ylim([0,1]);
legend([ p2, p4, p5, p10], 'Location','West')
set(gca,'FontSize',18,'FontName','Arial','XTick',[0.1,0.3,0.5,0.7,0.9])

saveas(Fig1,'./Figure/Fig5a','epsc'); saveas(Fig1,'./Figure/Fig5a');
saveas(Fig2,'./Figure/Fig5b','epsc'); saveas(Fig2,'./Figure/Fig5b');
% close all