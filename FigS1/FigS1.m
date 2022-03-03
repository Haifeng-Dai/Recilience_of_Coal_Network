clear; clc; rng('default'); rng(0); close all; tic;

load('.\Data\Data.mat')

Fig1 = figure(Name='Proportion vs Year', ...
    NumberTitle='off');
bar(year, proportion)
set(gca, FontName='Arial', ...
    FontSize=18, ...
    YTick=[0, 0.2, 0.4, 0.6, 0.8], ...
    yticklabels=[0, 20, 40, 60, 80])
xlabel('Year')
ylabel('Proportion')
text(2000, 0.85, '%', ...
    FontSize=18, ...
    FontName='Arial')

Fig2 = figure(Name='Total output vs Year', ...
    NumberTitle='off');
bar(year, total_output)
xlabel('Year')
ylabel('Output (ton)')
set(gca, FontName='Arial', ...
    FontSize=18)

saveas(Fig1, '.\Figure\FigS1b', 'epsc')
saveas(Fig1, '.\Figure\FigS1b')
saveas(Fig2, '.\Figure\FigS1a', 'epsc')
saveas(Fig2, '.\Figure\FigS1a')