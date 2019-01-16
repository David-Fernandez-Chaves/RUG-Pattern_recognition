% Assignment 1

t=[0.05,0.1,0.15,0.2,0.25,0.12];

load('cluster_data');

distances=zeros(size(cluster_data,1),size(cluster_data,1));

%Ploting data
for p=1:size(cluster_data,1)
    distances(p,p:end)=pdist2(cluster_data(p,:),cluster_data(p:end,:));    
end

% figure
for tt = 1:size(t,2)
%     subplot(3,2,tt)
    figure
    hold on
    scatter(cluster_data(:,1),cluster_data(:,2),40);
    title(sprintf('t=%f',t(tt)));
    [row, colums] = find(and(distances<t(tt),distances>0));
    
    for p=1:size(row,1)
       plot([cluster_data(row(p),1),cluster_data(colums(p),1)],[cluster_data(row(p),2),cluster_data(colums(p),2)])
    end


    xlabel('x-axis')
    ylabel('y-axis')
end