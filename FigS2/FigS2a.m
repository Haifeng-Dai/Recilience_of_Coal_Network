clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

WS; WS_LowInitial

load('./Data/Data_WS.mat', 'Data', 'eta_eff_c', 'N', 'm')
Reff = Data(:,:,3);
etaeff = Data(:,:,4);
R = Data(:,:,1);
ReffMean = mean(Reff,2);
ReffMax = max(Reff,[],2);
ReffMin = min(Reff,[],2);
ErrorUpReff = ReffMax - ReffMean;
ErrorDownReff = ReffMean - ReffMin;
etaeffMean = mean(etaeff,2);
etaeffMax = max(etaeff,[],2);
etaeffMin = min(etaeff,[],2);
ErrorUpeta = etaeffMax - etaeffMean;
ErrorDowneta = etaeffMean - etaeffMin;
RMean = mean(R,2);
RMax = max(R,[],2);
RMin = min(R,[],2);
ErrorUpR = RMax - RMean;
ErrorDownR = RMean - RMin;
RMean(19:end) = 0;
ErrorDownR(19:end) = 0;
ErrorUpR(19:end) = 0;

load('./Data/Data_WS_LowInitial.mat', 'Data')
Reff = Data(:,:,3);
etaeff = Data(:,:,4);
R = Data(:,:,1);
ReffMean2 = mean(Reff,2);
ReffMax = max(Reff,[],2);
ReffMin = min(Reff,[],2);
ErrorUpReff2 = ReffMax - ReffMean2;
ErrorDownReff2 = ReffMean2 - ReffMin;
connectivity = 2*(m/N)';

n = 2;
connectivity = connectivity(1:n:end);
ReffMean = ReffMean(1:n:end);
ErrorDownReff = ErrorDownReff(1:n:end);
ErrorUpReff = ErrorUpReff(1:n:end);
RMean = RMean(1:n:end);
ErrorDownR = ErrorDownR(1:n:end);
ErrorUpR = ErrorUpR(1:n:end);
etaeffMean = etaeffMean(1:n:end);
ErrorDowneta = ErrorDowneta(1:n:end);
ErrorUpeta = ErrorUpeta(1:n:end);
ReffMean2 =  ReffMean2(1:n:end);
ErrorDownReff2 = ErrorDownReff2(1:n:end);
ErrorUpReff2 = ErrorUpReff2(1:n:end);

Fig = figure(Name='eta_{eff} vs Connectivity', ...
    NumberTitle='off');
errorbar(connectivity, etaeffMean, ErrorDowneta, ErrorUpeta, ...
    LineStyle='-', ...
    Marker='o', ...
    MarkerSize=6, ...
    LineWidth=2)
hold on;
plot(0:0.1:1, eta_eff_c*ones(length(0:0.1:1),1), ...
    LineStyle='--', ...
    LineWidth=2)
text(0.05, 0.85, 'Critical Value', ...
    FontSize=18, ...
    FontName='Arial', ...
    Color='#D95319')
xlabel('Connectivity')
ylabel('\eta_{eff}')
xlim([0,1])
set(gca, FontSize=18, ...
    FontName='Arial')

saveas(Fig,'./Figure/FigS2a','epsc')
saveas(Fig,'./Figure/FigS2a');