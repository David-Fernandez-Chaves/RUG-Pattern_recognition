%Assignment1
close all
%Setting and Load Datas
nu=0.01;
nWA = 2;
nWB = 2;

A = importdata('data_lvq_A(1).mat');
B = importdata('data_lvq_B(1).mat');
datas = [A;B];

%Show the datas
figure
hold on
scatter(A(:,1),A(:,2),'r','filled')
scatter(B(:,1),B(:,2),'b','filled')

%Prototypes initialization
w = zeros(nWA+nWB,size(A,2));
xAmin=min(A(:,1));
yAmin=min(A(:,2));
xBmin=min(B(:,1));
yBmin=min(B(:,2));
for n=1:size(w,1)
    if n<=nWA
       w(n,1)=xAmin+rand()*(max(A(:,1)-xAmin));
       w(n,2)=yAmin+rand()*(max(A(:,2)-yAmin));
       %w(n,1)=mean(A(:,1));
       %w(n,2)=mean(A(:,2));  
    else
       w(n,1)=xBmin+rand()*(max(B(:,1)-xBmin));
       w(n,2)=yBmin+rand()*(max(B(:,2)-yBmin));
       %w(nWA+n,1)=mean(B(:,1));
       %w(nWA+n,2)=mean(B(:,2));    
    end
end

%Prototypes ploting
colors = rand(size(w,1),3);
for n=1:size(w,1)
   plot(w(n,1),w(n,2),'--gs',...
    'LineWidth',2,...
    'MarkerSize',8,...
    'MarkerEdgeColor',colors(n,:),...
    'MarkerFaceColor',colors(n,:))      
end

%Until the training error be approximately constant
TrainingError=[1,0];
while abs(TrainingError(size(TrainingError,1),1)-TrainingError(size(TrainingError,1),2))>0.000001
    for n=1:size(datas,1)
        dif=(w-datas(n,:)); %Get the difference
        distance = vecnorm(dif'); %Get the distance
        i=find(distance==min(distance)); %Find the minimum distance
        if xor(i<=nWA,n<=size(A,1)) %Check if the prototype and the data are of equal classes
            w(i,:)=w(i,:)-nu*(dif(i,:)); %Different classes
        else
            w(i,:)=w(i,:)+nu*(dif(i,:)); %Same class
        end            
    end
    for n=1:size(w,1)
       plot(w(n,1),w(n,2),'--gs',...
        'LineWidth',2,...
        'MarkerSize',8,...
        'MarkerEdgeColor',colors(n,:),...
        'MarkerFaceColor',colors(n,:))      
    end
    
    misclassified=0;
    for n=1:size(datas,1)
        dif=(w-datas(n,:)); %Get the difference
        distance = vecnorm(dif'); %Get the distance
        i=find(distance==min(distance)); %Find the minimum distance
        if xor(i<=nWA,n<=size(A,1)) %Check if the prototype and the data are of equal classes
            misclassified=misclassified+1;%Different classes
        end  
    end
    TrainingError=[TrainingError;[misclassified/size(datas,1),TrainingError(size(TrainingError,1),1)]];
end

figure
hold on
TrainingError(1,:) = [];
plot(TrainingError(:,1))
