%Assignment3
close all
%Setting and Load Datas
nu=0.01;
nWA = 2;
nWB = 1;
lambdas = [0.5 0.5];
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');


%% Plot the init data
figure;hold on;
scatter(A(:,1),A(:,2),'r','filled');
scatter(B(:,1),B(:,2),'b','filled');
xlabel('Feature 1');
ylabel('Feature 2');


%% Tag by class
[p,n] = size(A);
data = zeros(p*2,n+1);
data(:,1:2) = [A;B];
data(1:p,3) = 1; %points of class A
data(p+1:end,3) = 2; %points of class B
%rng(9); %fix randperm
data = data(randperm(p*2),:); %shuffle the data


%% Training
[lambdasVector,w,trainingErrorVector] = RLVQ_learning(data,nu,nWA,nWB,lambdas);


%% Plot final prototypes
scatter(w(:,1),w(:,2),'g','filled');


%% Training Error and lambdas progress
figure; hold on;
subplot(1,2,1);
plot(trainingErrorVector);
xlabel('Epochs');
ylabel('Training Error(%)');
subplot(1,2,2);
plot(lambdasVector(:,:));
xlabel('Epochs');
ylabel('lambdas');