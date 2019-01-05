%Assignment3
%close all
%Setting and Load Datas
nFold=10;
nu=0.01;
nWA = 2;
nWB = 1;
lambdas = [0.5 0.5];
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
data = [A;B];
data = [data,[zeros(size(A,1),1)+1;zeros(size(B,1),1)+2]];
data = data(randperm(size(data,1)),:); %shuffle the data
%reshape datas
rowdist = (size(data,1) / nFold) * ones(1, nFold);
partitions = mat2cell(data, rowdist, size(data,2));

errClass = zeros(nFold,1); %error test
errClassTrain = zeros(nFold,1); %error training
%% CrossValidation
for foldnumber=1:nFold
    %Separate the training and test data
    dataTest = partitions{foldnumber};
    dataTrain = cat(1,partitions{1:foldnumber-1},partitions{foldnumber+1:size(partitions,1)});
    
    %Do the learning process
    [lambdasVector,w,errorEpoch] = RLVQ_learning(dataTrain,nu,nWA,nWB,lambdas);
    errClassTrain(foldnumber) = errorEpoch(end); %final training error of the epoch
    %Get the test error
    errClass(foldnumber) = RLVQ_test(dataTest,w,lambdasVector(end,:)); %test error of the epoch
end
figure; hold on;
bar(errClassTrain);
meanTestError = mean(errClass);
plot([0 11],[meanTestError meanTestError]);
axis([1 size(errClass,1) 0 1])
xlabel('Number of fold');
ylabel('Error(%)');
legend({'Training Error','Mean Test Error'})
title('Error for each fold');