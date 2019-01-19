clear; clc;
X = importdata('provinces.mat');
X = zscore(X);
Y = pdist(X,'Euclidean');
D = squareform(Y);
[num1,mostSimilar] = sort(D(9,:)); %9 is the position of Groningen
mostSimilar = mostSimilar(2); %the most similar is oneself
num1 = num1(2);
[num2,lessSimilar] = max(D(9,:));