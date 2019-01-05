%Assignment2
%close all
%Setting and Load data
nFold=10;
nu=0.01;
nWA = 2;
nWB = 1;
nFold=10;
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




