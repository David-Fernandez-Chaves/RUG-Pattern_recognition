function [means] = kmeans2D(data,k)

% Initializations
    means = data(randperm(size(data,1),k),:); %k random point from the set
    data = [data,zeros(size(data,1),1)]; %extra column for tag
    colors=rand(k,3); 
    meansAcc = means; %means through iteration
    diff=1; %Loop condition
    oldtag = zeros(size(data,1),1)+1;
    
% Training
    while diff>0
        % Assign each point to its closest mean
        [~,data(:,3)] = min(pdist2(means,data(:,1:2)));
        % Check differences
        diff = sum(abs(oldtag-data(:,3)));        
        oldtag = data(:,3);
        % Update means
        for idx = 1:k
            means(idx,:) = mean(data(data(:,3) == idx,1:2));
        end
        meansAcc = [meansAcc; means];
    end
    
% Plot of classes and final means
    figure;hold on; 
    for idx = 1:k
        scatter(data(data(:,3)==idx,1),data(data(:,3)==idx,2),10,colors(idx,:),'filled');
    end
    
%Final means
    %scatter(means(:,1),means(:,2),30,'ks','filled');
    
%Movement of the means
    for idx = 1:size(meansAcc,1)-k
        plot_arrow(meansAcc(idx,1),meansAcc(idx,2),meansAcc(idx+k,1),meansAcc(idx+k,2),'linewidth',3);
    end
    xlabel('Feature 1');
    ylabel('Feature 2');
end
