close all; clear; clc; rng('default'); rng(0); tic;
% area
x = 0:1e-3:1;

y = sqrt(1-x) + 1;
z = -sqrt(1-x) + 1;

Fig1 = figure(NumberTitle='off',Name='\it \sqrt{1-x}');

area(y, z); hold on
line1 = plot(x, y, LineWidth=2); hold on
line2 = plot(x, z, LineWidth=2); hold on
line([1 1], [0 2], LineStyle='--', LineWidth=2)
xlim([0,1.2]); ylim([0,2])
set(gca, FontSize=18, FontName='Times New Roman')