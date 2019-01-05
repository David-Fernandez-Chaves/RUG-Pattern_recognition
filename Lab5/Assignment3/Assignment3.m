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
data = [A;B];
data = [data,[zeros(size(A,1),1)+1;zeros(size(B,1),1)+2]];
data = data(randperm(size(data,1)),:); %shuffle the data


%% Training
[lambdasVector,w,trainingErrorVector] = RLVQ_learning(data,nu,nWA,nWB,lambdas);


%% Plot final prototypes
scatter(w(:,1),w(:,2),'g','filled');


%% Training Error and lambdas progress
figure; hold on;
subplot(1,2,1);
plot(trainingErrorVector*100);
axis([1 size(trainingErrorVector,1) 0 100])
xlabel('Epochs');
ylabel('Training Error(%)');
subplot(1,2,2);
plot(lambdasVector(:,:));
xlabel('Epochs');
ylabel('lambdas');