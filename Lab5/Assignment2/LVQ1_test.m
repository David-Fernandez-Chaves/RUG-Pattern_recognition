function [missclassified] = LVQ1_test(datas,w)
%LVQ1 testing for two class
    %   datas
    %   initial prototypes posicion
    missclassified=0;
    for n=1:size(datas,1)
        dif=(w(:,1:2)-datas(n,1:2)); %Get the difference
        distance = sum(dif.^2,2); %squared euclidean norm
        [~,i] = min(distance); %Find the minimum distance
        if w(i,3) ~= datas(n,3) %Check if the prototype and the data are of equal classes
            missclassified=missclassified+1;%Different classes
        end
    end
    missclassified = missclassified/size(datas,1);
end

