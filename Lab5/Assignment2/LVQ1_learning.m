function [w,TrainingError] = LVQ1_learning(datas,nu,nWA,nWB)
%LVQ1 learning for two class
    %datas
    %learning percentage
    %number of class A prototypes
    %number of class B prototypes
    OldTrainingError=1;
    TrainingError=0;
    %% Prototypes initialization
    w = zeros(nWA+nWB,3);
    classA = datas(datas(:,3) == 1,:);
    w(1:nWA,:) = classA(randperm(size(classA,1),nWA),:); %prototypes of class A 
    classB = datas(datas(:,3) == 2,:);
    w(nWA+1:end,:) = classB(randperm(size(classB,1),nWB),:); %prototypes of class B 
    %% Training
    while abs(OldTrainingError-TrainingError)>0.000000001
        for n=1:size(datas,1)
            dif=(w(:,1:2)-datas(n,1:2)); %Get the difference
            distance = sum(dif.^2,2); %squared euclidean norm
            [~,i] = min(distance); %Find the minimum distance
            if w(i,3) ~= datas(n,3) %Check if the prototype and the data are of equal classes
                w(i,1:2)=w(i,1:2)+nu*(dif(i,:)); %Different classes
            else
                w(i,1:2)=w(i,1:2)-nu*(dif(i,:)); %Same class
            end  
        end

        % Geting Training Error
        missclassified=0;
        for n=1:size(datas,1)
            dif=(w(:,1:2)-datas(n,1:2)); %Get the difference
            distance = sum(dif.^2,2); %squared euclidean norm
            [~,i] = min(distance); %Find the minimum distance
            if w(i,3) ~= datas(n,3) %Check if the prototype and the data are of equal classes
                missclassified=missclassified+1;%Different classes
            end

        end
        OldTrainingError=TrainingError;
        TrainingError=missclassified/size(datas,1);
    end

end