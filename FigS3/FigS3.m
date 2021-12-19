clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

% BA

load ./Data/Data_BA.mat; Reff = Data(:,:,3); etaeff = Data(:,:,4); R = Data(:,:,1);
ReffMean = mean(Reff,2); ReffMax = max(Reff,[],2); ReffMin = min(Reff,[],2);
ErrorUpReff = ReffMax - ReffMean; ErrorDownReff = ReffMean - ReffMin;
etaeffMean = mean(etaeff,2); etaeffMax = max(etaeff,[],2); etaeffMin = min(etaeff,[],2);
ErrorUpeta = etaeffMax - etaeffMean; ErrorDowneta = etaeffMean - etaeffMin;
RMean = mean(R,2); RMax = max(R,[],2); RMin = min(R,[],2);
ErrorUpR = RMax - RMean; ErrorDownR = RMean - RMin;
% RMean(14:17) = 0; ErrorUpR(14:17) = 0; ErrorDownR(14:17) = 0;
eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta) * ones(11,1);

connectivity = zeros(length(m),1);
for i = 1 : length(m)
    all = sum(sum(ones(N,N)-eye(N,N)));
    connectivity(i) = sum(sum(Net_BA(N,m(i))))/all;
end
Fig1 = figure('Name','R_{eff} vs Conneivity','NumberTitle','off');
errorbar(connectivity,ReffMean,ErrorDownReff,ErrorUpReff,'--o','MarkerSize',6,'LineWidth',2,'DisplayName','Numerical'); hold on
errorbar(connectivity,RMean,ErrorDownR,ErrorUpR,'-o','MarkerSize',6,'LineWidth',2,'DisplayName','Theoretical');
legend('Location','best')
xlabel('Connectivity'); ylabel('R_{eff}');
xlim([0,0.4]); ylim([0,1]);
set(gca,'FontSize',18,'FontName','Arial')

Fig2 = figure('Name','eta_{eff} vs Connectivity','NumberTitle','off');
errorbar(connectivity,etaeffMean,ErrorDowneta,ErrorUpeta,'-o','MarkerSize',6,'LineWidth',2); hold on;
plot(0:0.1:1,eta_eff_c,'--','LineWidth',2);
text(0.05,0.85,'Critical Value','FontSize',18,'FontName','Arial','Color','#D95319')
xlabel('Connectivity'); ylabel('\eta_{eff}');
xlim([0,0.4]); ylim([0,1]);
set(gca,'FontSize',18,'FontName','Arial')

saveas(Fig1,'./Figure/FigS3a','epsc'); saveas(Fig1,'./Figure/FigS3a');
saveas(Fig2,'./Figure/FigS3b','epsc'); saveas(Fig2,'./Figure/FigS3b');