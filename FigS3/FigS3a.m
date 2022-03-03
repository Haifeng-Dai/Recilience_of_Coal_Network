clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')

BA

load('./Data/Data_BA.mat', 'Data', 'x_axis', 'm', 'N', 'eta_eff_c')
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

critial = 0.748;
connectivity = (m/N)';
RMean(25:end) = 0;
ErrorDownR(25:end) = 0;
ErrorUpR(25:end) = 0;

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
xlim([0,0.8])
set(gca, ...
    FontSize=18, ...
    FontName='Arial')

saveas(Fig,'./Figure/FigS3a','epsc')
saveas(Fig,'./Figure/FigS3a');