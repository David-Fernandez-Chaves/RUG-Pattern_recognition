function [new_means] = kmeans2D(data,k)

% Initializations
means = data(randperm(size(data,1),k),:); %k random point from the set

data = [data,zeros(size(data,1),1)]; %extra column for tag

diff=1; %Criterion condition

% Training
    while diff>0
        % Assign each point to its closest mean
        [~,data(:,3)] = min(pdist2(means,data(:,1:2)));
        
        % Plot
        figure;hold on;
        scatter(set(set(:,3)==1,1),set(set(:,3)==1,2),'r','filled');
        scatter(set(set(:,3)==2,1),set(set(:,3)==2,2),'b','filled');
        scatter(new_means(:,1),new_means(:,2),'g','filled');
        xlabel('Feature 1');
        ylabel('Feature 2');
        % Update means
        for idx = 1:k
            means(idx,:) = mean(data(data(:,3) == idx,1:2));
        end

    end

end
