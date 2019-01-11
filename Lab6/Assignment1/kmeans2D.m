function [means] = kmeans2D(data,k)

% Initializations
means = data(randperm(size(data,1),k),:); %k random point from the set
data = [data,zeros(size(data,1),1)]; %extra column for tag
colors=rand(k,3);

diff=1; %Criterion condition
oldtag = zeros(size(data,1),1)+1;

% Plot
figure;hold on;

% Training
    while diff>0
        % Assign each point to its closest mean
        [~,data(:,3)] = min(pdist2(means,data(:,1:2)));
        
        diff = sum(abs(oldtag-data(:,3)));        
        oldtag = data(:,3);
        
        % Update means
        for idx = 1:k

          
            oldmeans = means;
            means(idx,:) = mean(data(data(:,3) == idx,1:2));
            plot_arrow(oldmeans(idx,1),oldmeans(idx,2),means(idx,1),means(idx,2),...
                'linewidth',3)
        end

    end
    
    for idx = 1:k
        scatter(data(data(:,3)==idx,1),data(data(:,3)==idx,2),10,'MarkerEdgeColor',colors(idx,:),...
            'MarkerFaceColor',colors(idx,:),...
            'LineWidth',1.5)
    end
    
    xlabel('Feature 1');
    ylabel('Feature 2');

end
