% Assignment 2

load('cluster_data');


%% Question 1
Z = linkage(cluster_data,'single');
c = cluster(Z,'Maxclust',4);

%Ploting
figure
scatter(cluster_data(:,1),cluster_data(:,2),20,c,'filled')
xlabel('x-axis')
ylabel('y-axis')
title('single-linkage');
    
%% Question 2
Z = linkage(cluster_data,'complete');
c = cluster(Z,'Maxclust',4);

%Ploting
figure
scatter(cluster_data(:,1),cluster_data(:,2),20,c,'filled')
xlabel('x-axis')
ylabel('y-axis')
title('complete-linkage');

%% Question 5
Z = linkage(cluster_data,'average');
c = cluster(Z,'Maxclust',4);

%Ploting
figure
scatter(cluster_data(:,1),cluster_data(:,2),20,c,'filled')
xlabel('x-axis')
ylabel('y-axis')
title('average-linkage');

%% Question 6
dendrogram(Z)
%ans: 4





