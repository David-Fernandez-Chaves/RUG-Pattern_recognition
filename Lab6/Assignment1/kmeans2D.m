function [new_means] = kmeans2D(data,k)

% Initializations
means = zeros(k,2);
new_means = data(randperm(size(data,1),k),:); %k random point from the set
set = zeros(size(data,1),3); %extra column for tag
set(:,1:2) = data;
% Training
while means ~= new_means
    means = new_means;
    % Assign each point to its closest mean
    [~,set(:,3)] = min(pdist2(means,set(:,1:2)));
    % Plot
    figure;hold on;
    scatter(set(set(:,3)==1,1),set(set(:,3)==1,2),'r','filled');
    scatter(set(set(:,3)==2,1),set(set(:,3)==2,2),'b','filled');
    scatter(new_means(:,1),new_means(:,2),'g','filled');
    xlabel('Feature 1');
    ylabel('Feature 2');
    % Update means
    for idx = 1:k
        new_means(idx,:) = mean(set(set(:,3) == idx));
    end
end
end

