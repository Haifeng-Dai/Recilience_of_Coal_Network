clear; clc; rng('default'); rng(0); close all; tic

mkdir('./Figure/'); mkdir('./Data/')

Empirical_fn_scale_high; Empirical_fn_scale_low

load('.\Data\Data_Empirical_fn_scale_low.mat', 'Data')
Reff1 = Data(:,:,3);
etaeff1 = Data(:,:,4);
R1 = Data(:,:,1);
load('.\Data\Data_Empirical_fn_scale_high.mat', 'Data')
Reff2 = Data(:,:,3);
etaeff2 = Data(:,:,4);
R2 = Data(:,:,1);
ReffMean1 = mean(Reff1);
ReffMean2 = mean(Reff2);
etaeffMean1 = mean(etaeff1);
etaeffMean2 = mean(etaeff2);
RMean1 = mean(R1);
RMean2 = mean(R2);
WightRate = Data(1,:,5)/100;
n = 3;
WightRate = WightRate(1:n:end);
ReffMean1 = ReffMean1(1:n:end);
ReffMean2 = ReffMean2(1:n:end);
RMean1 = RMean1(1:n:end);
RMean2 = RMean2(1:n:end);
etaeffMean1 = etaeffMean1(1:n:end);
etaeffMean2 = etaeffMean2(1:n:end);

Fig1 = figure(Name='R_{eff} vs f_n', ...
    NumberTitle='off');
plot(WightRate, ReffMean1, ...
    LineStyle='--', ...
    Marker='o', ...
    Color=[0.85 0.325 0.098], ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='Closing small-sized coal mines of original network'); hold on
plot(WightRate, ReffMean2, ...
    LineStyle='--', ...
    Marker='s', ...
    Color=[0.929 0.694 0.125], ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='Closing large-sized coal mines of original network'); hold on
plot(WightRate, RMean1, ...
    LineStyle='-', ...
    Marker='o', ...
    MarkerSize=8, ...
    Color=[0.466 0.674 0.188], ...
    LineWidth=2, ...
    DisplayName='Closing small-sized coal mines of 1-D system'); hold on
plot(WightRate, RMean2,'-s', ...
    LineStyle='-', ...
    Marker='s', ...
    Color=[0.301 0.745 0.933], ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='Closing large-sized coal mines of 1-D system');
legend(Location='northwest', ...
    FontSize=11, ...
    FontName='Arial');
xlabel('f_n');
ylabel('R_{eff}');
xlim([0, 0.6]);
ylim([0.91,0.99]);
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0,0.2,0.4,0.6,0.8])

Fig2 = figure(Name='eta_{eff} vs f_n', ...
    NumberTitle='off');
plot(WightRate, etaeffMean1, ...
    LineStyle='--', ...
    Marker='o', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='Closing small-sized coal mines')
hold on
plot(WightRate, etaeffMean2, ...
    LineStyle='-', ...
    Marker='^', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='Closing large-sized coal mines');
legend(Location='southwest', ...
    FontSize=15, ...
    FontName='Arial');
xlabel('f_n');
ylabel('\eta_{eff}');
xlim([0, 0.6]);
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0,0.2,0.4,0.6,0.8])

saveas(Fig1, './Figure/Fig6a', 'epsc')
saveas(Fig1, './Figure/Fig6a')
saveas(Fig2, './Figure/FigS7a', 'epsc')
saveas(Fig2, './Figure/FigS7a')