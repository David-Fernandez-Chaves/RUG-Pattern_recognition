%Assignment2
%close all
%Setting and Load data
nFold=10;
nu=0.01;
nWA = 2;
nWB = 1;
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
[p,n] = size(A);
data = zeros(p*2,n+1);
data(:,1:2) = [A;B];
data(1:p,3) = 1; %points of class A
data(p+1:end,3) = 2; %points of class B
%rng(9); %fix randperm
data = data(randperm(p*2),:); %shuffle the data
section = round(p*2/nFold); %section
errClass = zeros(nFold,1); %error test
errClassTrain = zeros(nFold,1); %error training
%% CrossValidation
for foldnumber=1:nFold
    %Separate the training and test data
    dataTest = data((foldnumber-1)*section+1:foldnumber*section,:);
    dataTrain = data(~ismember(data,dataTest,'rows'),:);
    %Do the learning process
    [w,errClassTrain(foldnumber)] = LVQ1_learning(dataTrain,nu,nWA,nWB);
    %Get the test error
    errClass(foldnumber) = LVQ1_test(dataTest,w);
end
figure; hold on;
bar(errClassTrain*100);
meanTestError = mean(errClass*100)
plot([0 11],[meanTestError meanTestError]);
axis([0 11 0 100])
xlabel('Number of fold');
ylabel('Error(%)');
legend({'Training Error','Mean Test Error'})
title('Error for each fold');




