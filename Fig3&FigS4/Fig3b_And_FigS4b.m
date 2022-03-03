clear; clc; rng('default'); rng(0); close all; tic;

mkdir('./Figure/'); mkdir('./Data/')

ER_fl;

load('.\Data\Data_ER_fl.mat', 'Data')
Reff = Data(:,:,3);
etaeff = Data(:,:,4);
R = Data(:,:,1);
ReffMean = mean(Reff);
ReffMax = max(Reff);
ReffMin = min(Reff);
ErrorUpReff = ReffMax - ReffMean;
ErrorDownReff = ReffMean - ReffMin;
etaeffMean = mean(etaeff);
etaeffMax = max(etaeff);
etaeffMin = min(etaeff);
ErrorUpeta = etaeffMax - etaeffMean;
ErrorDowneta = etaeffMean - etaeffMin;
RMean = mean(R);
RMax = max(R);
RMin = min(R);
ErrorUpR = RMax - RMean;
ErrorDownR = RMean - RMin;
WightRate = Data(1,:,5);
n = 4;
WightRate = WightRate(1:n:end);
ReffMean = ReffMean(1:n:end);
RMean = RMean(1:n:end);
ErrorDownReff = ErrorDownReff(1:n:end);
ErrorUpReff = ErrorUpReff(1:n:end);
etaeffMean = etaeffMean(1:n:end);
ErrorDowneta = ErrorDowneta(1:n:end);
ErrorUpeta = ErrorUpeta(1:n:end);

Fig1 = figure(Name='R_{eff} vs f_l', ...
    NumberTitle='off');
errorbar(WightRate, RMean, ErrorDownReff, ErrorUpReff, ...
    LineStyle='-', ...
    Marker='^', ...
    Color=[112 150 171]/255, ...
    MarkerSize=6, ...
    LineWidth=2, ...
    DisplayName='Theroetical')
hold on
errorbar(WightRate, ReffMean, ErrorDownReff, ErrorUpReff, ...
    LineStyle='--', ...
    Marker='o', ...
    Color=[214 39 40]/255, ...
    MarkerSize=6, ...
    LineWidth=2, ...
    DisplayName='Numerical')
legend(Location='southeast')
xlabel('f_l')
ylabel('R_{eff}')
ylim([0.9, 1])
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0,0.2,0.4,0.6,0.8,1])

Fig2 = figure(Name='eta_{eff} vs f_l', ...
    NumberTitle='off');
errorbar(WightRate, etaeffMean, ErrorDowneta, ErrorUpeta, ...
    LineStyle='-', ...
    Marker='o', ...
    MarkerSize=6, ...
    LineWidth=2);
xlabel('f_l')
ylabel('\eta_{eff}')
ylim([0,0.15])
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0,0.2,0.4,0.6,0.8,1])

savefig(Fig1, './Figure/Fig3b')
saveas(Fig1, './Figure/Fig3b', 'epsc')
savefig(Fig2, './Figure/FigS4b')
saveas(Fig2, './Figure/FigS4b', 'epsc');