function [meansAcc,data] = kmeans2D(data,k)

% Initializations
    means = data(randperm(size(data,1),k),:); %k random point from the set
    data = [data,zeros(size(data,1),1)]; %extra column for tag
    meansAcc = means; %means through iteration
    diff=1; %Loop condition
    oldtag = zeros(size(data,1),1)+1;
    
% Training
    while diff>0
        % Assign each point to its closest mean
        [~,data(:,3)] = min(pdist2(means,data(:,1:2)));
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
    
end
