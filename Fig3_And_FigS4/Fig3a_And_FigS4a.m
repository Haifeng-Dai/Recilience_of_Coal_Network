clear; clc; rng('default'); rng(0); tic;

mkdir('./Figure/'); mkdir('./Data/')

% ER_fn_High; ER_fn_Low; ER_fn_Random;

load ./Data/Data_ER_fn_High.mat; Reff1(1:D1,1:D2) = Data(:,:,3); etaeff1 = Data(:,:,4); R1 = Data(:,:,1);
load ./Data/Data_ER_fn_Low.mat; Reff2(1:D1,1:D2) = Data(:,:,3); etaeff2 = Data(:,:,4); R2 = Data(:,:,1);
load ./Data/Data_ER_fn_Random.mat; Reff3(1:D1,1:D2) = Data(:,:,3); etaeff3 = Data(:,:,4); R3 = Data(:,:,1);
ReffMean1 = mean(Reff1); ReffMean2 = mean(Reff2); ReffMean3 = mean(Reff3);
etaeffMean1 = mean(etaeff1); etaeffMean2 = mean(etaeff2); etaeffMean3 = mean(etaeff3);
RMean1 = mean(R1); RMean2 = mean(R2); RMean3 = mean(R3);
WightRate = Data(1,:,5);
n = 4;
WightRate = WightRate(1:n:end); ReffMean1 = ReffMean1(1:n:end); ReffMean2 = ReffMean2(1:n:end); ReffMean3 = ReffMean3(1:n:end);
RMean1 = RMean1(1:n:end); RMean2 = RMean2(1:n:end); RMean3 = RMean3(1:n:end);
etaeffMean1 = etaeffMean1(1:n:end); etaeffMean2 = etaeffMean2(1:n:end); etaeffMean3 = etaeffMean3(1:n:end);

Fig1 = figure('Name','R_{eff} vs f_n','NumberTitle','off');
plot(WightRate,ReffMean1,'--o','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (i) for Original Network'); hold on
plot(WightRate,ReffMean2,'--s','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (ii) for Original Network'); hold on
plot(WightRate,ReffMean3,'--d','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (iii) for Original Network'); hold on
plot(WightRate,RMean1,'-p','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (i) for 1D Network'); hold on
plot(WightRate,RMean2,'-h','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (ii) for 1D Network'); hold on
plot(WightRate,RMean3,'-<','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (iii) for 1D Network');
legend('Position',[0.1709,0.688,0.4268,0.2369],'FontSize',10,'FontName','Arial');
xlabel('f_n'); ylabel('R_{eff}');% ylim([0.7,0.8]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0,0.2,0.4,0.6,0.8])

Fig2 = figure('Name','eta_{eff} vs f_n','NumberTitle','off');
plot(WightRate,etaeffMean1,'-o','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (i)'); hold on
plot(WightRate,etaeffMean2,'-^','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (ii)'); hold on
plot(WightRate,etaeffMean3,'-d','MarkerSize',8,'LineWidth',2,'DisplayName','Strategy (iii)');
legend('Location','Best','FontSize',16,'FontName','Arial');
xlabel('f_n'); ylabel('\eta_{eff}');% ylim([0,0.15]);
set(gca,'FontSize',18,'FontName','Arial','XTick',[0,0.2,0.4,0.6,0.8])

saveas(Fig1,'./Figure/Fig3a','epsc'); saveas(Fig1,'./Figure/Fig3a');
saveas(Fig2,'./Figure/FigS4a','epsc'); saveas(Fig2,'./Figure/FigS4a');