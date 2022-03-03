clear; clc; rng('default'); rng(0); close all; tic;

mkdir('.\Data'); mkdir('.\Figure')

p = 0.1:0.1:0.9;
loop = 50;
S = 100;
mu = 1;
KL = 0.2;

x_axis = length(p);
eta_eff_inloop = zeros(loop,1);
eta_eff = zeros(x_axis,1);
eta_eff_theoretical = zeros(x_axis,1);

alpha = 0.5;
c = 0.2;
K = 1;
delta = 1/5;
theta = 0.95;
eta_eff_c = ((K + c -2 * sqrt(K * c)) * alpha) / (K * delta) * ones(x_axis,1);

for i = 1:x_axis
    for j = 1:loop
        A = KL * Net_ER(S,p(i)) .* normrnd(mu, (mu / 5), [S, S]);
        beta_eff = (sum(A) * sum(A,2)) / (sum(sum(A)));
        eta_eff_inloop(j) = beta_eff - theta * beta_eff;
    end
    eta_eff(i) = mean(eta_eff_inloop);
end

save('.\Data\Data_Fig2b.mat')

Fig = figure(Name='R_eff vs connectivity', ...
    NumberTitle='off');
plot(p, eta_eff, ...
    LineStyle='none', ...
    Marker='.', ...
    MarkerSize=20)
hold on;
plot(p, eta_eff_c, ...
    LineStyle='--', ...
    LineWidth=2, ...
    Color='#D95319');
text(0.15, 0.85, 'Critical Value', ...
    FontSize=18, ...
    FontName='Arial', ...
    Color='#D95319')
xlabel('Connectivity')
ylabel('\eta_{eff}')
xlim([0.1 0.9])
box on
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0.1,0.3,0.5,0.7,0.9])

saveas(Fig, '.\Figure\Fig2b', 'epsc')
saveas(Fig, '.\Figure\Fig2b')