function [meansAcc,data,J] = kmeans2Dpp(data,k,means)

% Initializations
    if isempty(means)
        means = data(randperm(size(data,1),k),:); %k random point from the set
    end
    data = [data,zeros(size(data,1),1)]; %extra column for tag
    meansAcc = means; %means through iteration
    diff=1; %Loop condition
    oldtag = zeros(size(data,1),1)+1;
    
% Training
    if k>1
        while diff>0
            % Assign each point to its closest mean
            [distances,data(:,3)] = min(pdist2(means,data(:,1:2)));
            % Check differences
            diff = sum(abs(oldtag-data(:,3)));        
            if(diff>0)
                oldtag = data(:,3);
                % Update means
                for idx = 1:k
                    means(idx,:) = mean(data(data(:,3) == idx,1:2));
                end
                meansAcc = [meansAcc; means];
            end
        end
    else
       data(:,3)=1;
       distances = pdist2(means,data(:,1:2));
       means(1,:) = mean(data(:,1:2));
       meansAcc = means;
    end
    
    J=sum(distances);
    
end
