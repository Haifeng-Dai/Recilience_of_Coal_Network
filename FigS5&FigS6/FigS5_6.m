clear; clc; rng('default'); rng(0); close all; tic
load('./Data/Data_Empirical.mat', 'C');

mkdir('./Figure/'); mkdir('./Data/')

AdjacencyMatrix = C;

DegreeVector = sum(AdjacencyMatrix, 2);
MaxDegree = max(DegreeVector);
Degree = 0:MaxDegree;
NodeNumber = zeros(MaxDegree+1, 1);
TotalDegree = sum(DegreeVector);
for degree = 0 : MaxDegree
    NodeList = find(DegreeVector==degree);
    NodeNumber(degree+1) = length(NodeList) / TotalDegree;
end

Fig1 = figure(Name='Degree Probability Distribution', ...
    NumberTitle='off');
bar(Degree, NodeNumber, ...
    FaceColor='0.85,0.33,0.10')
xlabel('Degree k')
ylabel(' Probability of degree P(k)')
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[0,5,10,15,20,25,30], ...
    YTick=[0,0.004,0.008,0.012], ...
    YTickLabel=[0.000,0.004,0.008,0.012])

Fig2 = figure(Name='Adjacency Matrix', ...
    NumberTitle='off');
spy(AdjacencyMatrix, 'b')
xlabel('')
set(gca, FontSize=18, ...
    FontName='Arial', ...
    XTick=[], ...
    YTick=[])

saveas(Fig1, './Figure/FigS5', 'epsc')
saveas(Fig1,'./Figure/FigS5')
saveas(Fig2, './Figure/FigS6', 'epsc')
saveas(Fig2,'./Figure/FigS6')