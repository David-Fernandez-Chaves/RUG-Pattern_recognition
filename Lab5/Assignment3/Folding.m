%Assignment3
close all
%Setting and Load Datas
nFold=10;
nu=0.01;
nWA = 2;
nWB = 1;
lambdas = [0.5 0.5];
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
[p,n] = size(A);
datas = zeros(p*2,n+1);
datas(:,1:2) = [A;B];
datas(1:p,3) = 1; %points of class A
datas(p+1:end,3) = 2; %points of class B
%rng(9); %fix randperm
datas = datas(randperm(p*2),:); %shuffle the data
section = round(p*2/nFold); %section
errClass = zeros(nFold,1); %error test
errClassTrain = zeros(nFold,1); %error training
%% CrossValidation
for foldnumber=1:nFold
    %Separate the training and test data
    dataTest = datas((foldnumber-1)*section+1:foldnumber*section,:);
    dataTrain = datas(~ismember(datas,dataTest,'rows'),:);
    %Do the learning process
    [lambdas,w,errClassTrain(foldnumber)] = RLVQ_learning(dataTrain,nu,nWA,nWB,lambdas);
    %Get the test error
    errClass(foldnumber) = RLVQ_test(dataTest,w,lambdas);
end
figure; hold on;
bar(errClassTrain*100);
meanTestError = mean(errClass*100);
plot([0 11],[meanTestError meanTestError]);
xlabel('Number of fold');
ylabel('Error(%)');
legend({'Training Error','Mean Test Error'})
title('Error for each fold');