function [meansAcc,data] = kmeans2D(data,k)

% Initializations
    means = data(randperm(size(data,1),k),:); %k random point from the set
    data = [data,zeros(size(data,1),1)]; %extra column for tag
    colors=rand(k,3); 
    markers = ['o','+','*','x','s','d','^','v','>','<','p','h'];
    mark = markers(uint8((size(markers,2)-1).*rand(k,1)+1));
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
    
% Plot of classes and final means
    figure;hold on; 
    for idx = 1:k
        scatter(data(data(:,3)==idx,1),data(data(:,3)==idx,2),10,colors(idx,:),markers(idx));
        
        for i=1:k:size(meansAcc,1)-k
            plot_arrow(meansAcc(i+(idx-1),1),meansAcc(i+(idx-1),2),meansAcc((idx-1)+i+k,1),meansAcc((idx-1)+i+k,2),...
                'linewidth',2,...
                'color',colors(idx,:),...
                'facecolor',colors(idx,:),...
                'edgecolor',[0 0 0]);
        end
    end
    
%Final means
    scatter(means(:,1),means(:,2),40,'ks','filled');
    
    xlabel('Feature 1');
    ylabel('Feature 2');
end
