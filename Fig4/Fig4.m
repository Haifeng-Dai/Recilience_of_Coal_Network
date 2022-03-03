clear; clc; rng('default'); rng(0); tic; close all

mkdir('./Figure/'); mkdir('./Data/')
  
SF21; SF23; SF25;

load('./Data/Data_SF2.1.mat', 'Data', 'N')
Reff1 = Data(:,:,3);
etaeff1 = Data(:,:,4);
R1 = Data(:,:,1);
ReffMean1 = mean(Reff1,2);
ReffMax1 = max(Reff1,[],2);
ReffMin1 = min(Reff1,[],2);
ErrorUpReff1 = ReffMax1 - ReffMean1;
ErrorDownReff1 = ReffMean1 - ReffMin1;
etaeffMean1 = mean(etaeff1,2);
etaeffMax1 = max(etaeff1,[],2);
etaeffMin1 = min(etaeff1,[],2);
ErrorUpeta1 = etaeffMax1 - etaeffMean1;
ErrorDowneta1 = etaeffMean1 - etaeffMin1;
RMean1 = mean(R1,2);
RMax1 = max(R1,[],2);
RMin1 = min(R1,[],2);
ErrorUpR1 = RMax1 - RMean1;
ErrorDownR1 = RMean1 - RMin1;

load('./Data/Data_SF2.3.mat', 'Data')
Reff2 = Data(:,:,3);
etaeff2 = Data(:,:,4);
R2 = Data(:,:,1);
ReffMean2 = mean(Reff2,2);
ReffMax2 = max(Reff2,[],2);
ReffMin2 = min(Reff2,[],2);
ErrorUpReff2 = ReffMax2 - ReffMean2;
ErrorDownReff2 = ReffMean2 - ReffMin2;
etaeffMean2 = mean(etaeff2,2);
etaeffMax2 = max(etaeff2,[],2);
etaeffMin2 = min(etaeff2,[],2);
ErrorUpeta2 = etaeffMax2 - etaeffMean2;
ErrorDowneta2 = etaeffMean2 - etaeffMin2;
RMean2 = mean(R2,2);
RMax2 = max(R2,[],2);
RMin2 = min(R2,[],2);
ErrorUpR2 = RMax2 - RMean2;
ErrorDownR2 = RMean2 - RMin2;

load('./Data/Data_SF2.5.mat', 'Data')
Reff3 = Data(:,:,3);
etaeff3 = Data(:,:,4);
R3 = Data(:,:,1);
ReffMean3 = mean(Reff3,2);
ReffMax3 = max(Reff3,[],2);
ReffMin3 = min(Reff3,[],2);
ErrorUpReff3 = ReffMax3 - ReffMean3;
ErrorDownReff3 = ReffMean3 - ReffMin3;
etaeffMean3 = mean(etaeff3,2);
etaeffMax3 = max(etaeff3,[],2);
etaeffMin3 = min(etaeff3,[],2);
ErrorUpeta3 = etaeffMax3 - etaeffMean3;
ErrorDowneta3 = etaeffMean3 - etaeffMin3;
RMean3 = mean(R3,2);
RMax3 = max(R3,[],2);
RMin3 = min(R3,[],2);
ErrorUpR3 = RMax3 - RMean3;
ErrorDownR3 = RMean3 - RMin3;

n = 2;
N = N(1:n:end);
ReffMean1 = ReffMean1(1:n:end);
ReffMean2 = ReffMean2(1:n:end);
ReffMean3 = ReffMean3(1:n:end);
etaeffMean1 = etaeffMean1(1:n:end);
etaeffMean2 = etaeffMean2(1:n:end);
etaeffMean3 = etaeffMean3(1:n:end);

Fig1 = figure(Name='R_{eff} vs N', ...
    NumberTitle='off');
plot(N, ReffMean1, ...
    LineStyle='-', ...
    Marker='*', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.1')
hold on
plot(N, ReffMean2, ...
    LineStyle='--', ...
    Marker='o', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.3')
hold on
plot(N, ReffMean3, ...
    LineStyle='-.', ...
    Marker='v', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.5')
legend(Location='Best')
xlabel('Network Size')
ylabel('R_{eff}')
ylim([0.8,1])
set(gca, FontSize=18, ...
    FontName='Arial')

Fig2 = figure(Name='eta_{eff} vs N', ...
    NumberTitle='off');
p1 = plot(N, etaeffMean1, ...
    LineStyle='-', ...
    Marker='*', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.1');
hold on;
p2 = plot(N, etaeffMean2, ...
    LineStyle='--', ...
    Marker='o', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.3');
hold on;
p3 = plot(N, etaeffMean3, ...
    LineStyle='-.', ...
    Marker='v', ...
    MarkerSize=8, ...
    LineWidth=2, ...
    DisplayName='\gamma_d=2.5');
xlabel('Network Size')
ylabel('\eta_{eff}')
ylim([0,0.24])
legend([p1, p2, p3], ...
    Location='Best')
set(gca, FontSize=18, ...
    FontName='Arial')

saveas(Fig1, './Figure/Fig4a', 'epsc')
saveas(Fig1, './Figure/Fig4a')
saveas(Fig2, './Figure/Fig4b', 'epsc')
saveas(Fig2, './Figure/Fig4b')