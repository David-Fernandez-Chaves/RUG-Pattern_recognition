function [meansAcc,data,J] = kmeans2D(data,k,pp)

    % Initializations
    means = data(randperm(size(data,1),k),:); %k random point from the set
    data = [data,zeros(size(data,1),1)]; %extra column for tag
    meansAcc = means; %means through iteration
    diff=1; %Loop condition
    oldtag = zeros(size(data,1),1)+1;
    
    if k==1
       data(:,3)=1;
       distances = pdist2(means,data(:,1:2));
       means(1,:) = mean(data(:,1:2));
       meansAcc = means;
    else    
        %% K-mean ++
        if and(~isempty(pp),pp>0)            
            means = means(1,:);
            for i=2:k
                if size(means,1)==1
                    distances = pdist2(means,data(:,1:2));
                else
                    distances = min(pdist2(means,data(:,1:2)));
                end
                D = cumsum(distances);
                if D(end) == 0, means(i:k,:) = data(ones(1,k-i+1),1:2); return; end
                d = data(find(rand < D/D(end),1),:);
                means = [means;d(1:2)];
            end
        end
        %% K-mean 
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
        
    end
    
    J=sum(distances);
    
end
