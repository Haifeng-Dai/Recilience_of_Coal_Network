clear; clc; rng('default'); rng(0); close all; tic;
load('.\Data\Data_Fig2a.mat', 'x0', 'x_low', 'x_high');

mkdir('./Figure/'); mkdir('./Data/')

ER_LowInitial;

load('.\Data\Data_ER_LowInitial.mat', 'Data')
Reff1 = Data(:,:,3);
etaeff1 = Data(:,:,4);
load('.\Data\Data_ER_fl.mat', 'Data')
Reff2 = Data(:,:,3);
etaeff2 = Data(:,:,4);
load('.\Data\Data_ER_fn_High.mat', 'Data')
Reff3 = Data(:,:,3);
etaeff3 = Data(:,:,4);
load('.\Data\Data_ER_fn_Low.mat', 'Data')
Reff4 = Data(:,:,3);
etaeff4 = Data(:,:,4);
load('.\Data\Data_ER_fn_Random.mat', 'Data')
Reff5 = Data(:,:,3);
etaeff5 = Data(:,:,4);
load('.\Data\Data_ER_fw.mat', 'Data')
Reff6 = Data(:,:,3);
etaeff6 = Data(:,:,4);
n = 1;

Fig = figure(Name='R_eff vs eta_eff', ...
    NumberTitle='off');
fplot(x_high, [0,1], ...
    LineStyle='-', ...
    Color=[0.4940 0.1840 0.5560], ...
    LineWidth=2, ...
    DisplayName='Sustainable')
hold on
fplot(x_low, [0,1], ...
    LineStyle='--', ...
    Color=[47 127 193]/255, ...
    LineWidth=2, ...
    DisplayName='Unstable')
hold on
fplot(x0, [0,1], ...
    LineStyle='-', ...
    Color=[73 108 136]/255, ...
    LineWidth=2, ...
    DisplayName='Depleted')
ylim([-0.05,1.1])
xlabel('\eta_{eff}')
ylabel('R_{eff}');
plot(etaeff1(1:n:end), Reff1(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color=[56 89 137]/255)
hold on
plot(etaeff6(1:n:end), Reff6(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color=[177 86 70]/255)
hold on
plot(etaeff5(1:n:end), Reff5(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color=[0 0.447 0.741])
hold on
plot(etaeff4(1:n:end), Reff4(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color=[0.85 0.325 0.098])
hold on
plot(etaeff3(1:n:end), Reff3(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color= [0.929 0.694 0.125])
hold on
plot(etaeff2(1:n:end), Reff2(1:n:end), ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=12, ...
    Color=[214 39 40]/255)
set(gca, FontSize=18, ...
    FontName='Arial');

saveas(Fig, './Figure/Fig3d', 'epsc')
saveas(Fig, './Figure/Fig3d')