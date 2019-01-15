
%Asignment2

load('checkerboard.mat');
load('clusterCentroids');
k=100;

%% Question 2
[prototypes] = batchNG(checkerboard, k, 500, 1, 2);

%% Question 3
[meansAcc,data,J] = kmeans2D_simple(checkerboard,k,clusterCentroids);
lastmean = size(meansAcc,1)-k;
means = meansAcc(lastmean+1:end,:);

%Ploting
figure
hold on
plot(checkerboard(:,1),checkerboard(:,2),'bo','markersize',3)
scatter(means(:,1),means(:,2),40,'ks','filled');
voronoi(means(:,1),means(:,2));
title('K-Mean Voronoi diagram');