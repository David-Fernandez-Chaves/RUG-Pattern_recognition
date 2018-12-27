function [w,TrainingError] = LVQ1_learning(datas,nWA,sizeLabelA,w,nu)
%LVQ1 learning for two class
%   datas
%   number of prototypes of A
%   initial prototypes posicion
%   learning percentage

    OldTrainingError=1;
    TrainingError=0;
    while abs(OldTrainingError-TrainingError)>0.000000001
        for n=1:size(datas,1)
            dif=(w-datas(n,:)); %Get the difference
            distance = vecnorm(dif'); %Get the distance
            i=find(distance==min(distance)); %Find the minimum distance
            if xor(i<=nWA,n<=sizeLabelA) %Check if the prototype and the data are of equal classes
                w(i,:)=w(i,:)+nu*(dif(i,:)); %Different classes
            else
                w(i,:)=w(i,:)-nu*(dif(i,:)); %Same class
            end  
        end

        % Geting Training Error
        misclassified=0;
        for n=1:size(datas,1)
            dif=(w-datas(n,:)); %Get the difference
            distance = vecnorm(dif'); %Get the distance
            i=find(distance==min(distance)); %Find the minimum distance
            if xor(i<=nWA,n<=sizeLabelA) %Check if the prototype and the data are of equal classes
                misclassified=misclassified+1;%Different classes
            end

        end
        OldTrainingError=TrainingError;
        TrainingError=misclassified/size(datas,1);
    end


end

