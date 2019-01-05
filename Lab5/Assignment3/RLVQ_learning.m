function [lambdasVector,w,TrainingErrorVector] = RLVQ_learning(data,nu,nWA,nWB,lambdas)
%LVQ1 learning for two class
    %data with class tags
    %learning percentage
    %number of class A prototypes
    %number of class B prototypes
    OldTrainingError=1;
    TrainingError=0;
    lambdasVector = lambdas;
    TrainingErrorVector = [];
    %% Prototypes initialization
    w = zeros(nWA+nWB,3);
    classA = data(data(:,3) == 1,:);
    w(1:nWA,:) = classA(randperm(size(classA,1),nWA),:); %prototypes of class A 
    classB = data(data(:,3) == 2,:);
    w(nWA+1:end,:) = classB(randperm(size(classB,1),nWB),:); %prototypes of class B 
    %% Training
    while abs(OldTrainingError-TrainingError)>0.000000001
        for n=1:size(data,1)
            dif=(w(:,1:2)-data(n,1:2)); %Get the difference
            distance = sum(lambdas.*(dif.^2),2); %squared euclidean norm
            [~,i] = min(distance); %Find the minimum distance
            if w(i,3) ~= data(n,3) %Check if the prototype and the data are of equal classes
                w(i,1:2)=w(i,1:2)+nu*(lambdas.*dif(i,:)); %Different classes
                lambdas = lambdas + nu*(dif(i,:)); %update lambdas
            else
                w(i,1:2)=w(i,1:2)-nu*(lambdas.*dif(i,:)); %Same class
                lambdas = lambdas - nu*(dif(i,:)); %update lambdas
            end
            lambdas = exp(lambdas)/sum(exp(lambdas));
        end

        % Geting Training Error
        missclassified=0;
        for n=1:size(data,1)
            dif=(w(:,1:2)-data(n,1:2)); %Get the difference
            distance = sum(lambdas.*(dif.^2),2); %squared euclidean norm
            [~,i] = min(distance); %Find the minimum distance
            if w(i,3) ~= data(n,3) %Check if the prototype and the data are of equal classes
                missclassified=missclassified+1;%Different classes
            end

        end
        OldTrainingError=TrainingError;
        TrainingError=missclassified/size(data,1);
        TrainingErrorVector = [TrainingErrorVector; TrainingError]; %training error for epoch
        lambdasVector = [lambdasVector; lambdas]; %lambdas for epoch
    end

end

