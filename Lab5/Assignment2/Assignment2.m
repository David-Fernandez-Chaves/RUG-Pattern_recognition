%Assignment2
%close all
%Setting and Load Datas
nFold=10;
nu=0.01;
nWA = 1;
nWB = 2;
A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
datas = [A;B];

%reshape datas
rowdist = size(datas,1) / nFold * ones(1, nFold);
partitions = mat2cell(datas, rowdist, size(datas,2));

figure

%% Prototypes initialization
w = zeros(nWA+nWB,size(datas,2));
xAmin=min(A(:,1));
yAmin=min(A(:,2));
xBmin=min(B(:,1));
yBmin=min(B(:,2));
for n=1:size(w,1)
    if n<=nWA
       w(n,1)=xAmin+rand()*(max(A(:,1)-xAmin));
       w(n,2)=yAmin+rand()*(max(A(:,2)-yAmin));
    else
       w(n,1)=xBmin+rand()*(max(B(:,1)-xBmin));
       w(n,2)=yBmin+rand()*(max(B(:,2)-yBmin));
    end
end

%% CrossValidation
for foldnumber=1:nFold
    %Separate the fold of the data
    subset=cat(1,partitions{1:foldnumber-1},partitions{foldnumber+1:size(partitions,1)});
    dataTest=partitions{foldnumber};
    
    sizeLabelA=size(A,1);
    if foldnumber<= sizeLabelA/nFold
       sizeLabelA=sizeLabelA-size(partitions{1},1);
    end
    
    %Do the learning process
    wn = LVQ1_learning(subset,nWA,sizeLabelA,w,nu);    
    
    if foldnumber<= sizeLabelA/nFold
       wnOfClassToTest=wn(1:nWA,:);
    else
       wnOfClassToTest=wn(nWA+1:size(wn,1),:);
    end
    
    %Get the error of each data
    ErrorData=zeros(1,size(dataTest,1));
    for n=1:size(dataTest,1)
        dif=(wnOfClassToTest-dataTest(n,:)); %Get the difference
        distance = vecnorm(dif'); %Get the distance
        i=find(distance==min(distance)); %Find the minimum distance
        ErrorData(n)=distance(i);
    end    

    subplot(5,2,foldnumber)
    hold on
    bar(ErrorData)
    MeanError = mean(ErrorData);
    plot([0 size(ErrorData,2)],[MeanError MeanError])
    title(['Fold: ',num2str(foldnumber),', Means: ',num2str(MeanError)])
end





