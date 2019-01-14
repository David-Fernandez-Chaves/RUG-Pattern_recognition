%Assignment1
% close all;
load('kmeans1.mat');
[means2,data2] = kmeans2D(kmeans1,2);
[means4,data4] = kmeans2D(kmeans1,4);
[means8,data8] = kmeans2D(kmeans1,8);

colors=rand(8,3); 
markers = ['o','+','*','x','s','d','^','v','>','<','p','h'];
mark = markers(uint8((size(markers,2)-1).*rand(8,1)+1));

%% Question 2 ----------------------------------------------------------
figure;

k=2;
subplot(3,1,1),hold on; 
for idx = 1:k
    scatter(data2(data2(:,3)==idx,1),data2(data2(:,3)==idx,2),10,colors(idx,:),mark(idx));
end    
%Final means
lastmean = size(means2,1)-k;
scatter(means2(lastmean:lastmean+k,1),means2(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');

k=4;
subplot(3,1,2),hold on; 
for idx = 1:k
    scatter(data4(data4(:,3)==idx,1),data4(data4(:,3)==idx,2),10,colors(idx,:),mark(idx));
end    
%Final means
lastmean = size(means4,1)-k;
scatter(means4(lastmean:lastmean+k,1),means4(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');


k=8;
subplot(3,1,3),hold on; 
for idx = 1:k
    scatter(data8(data8(:,3)==idx,1),data8(data8(:,3)==idx,2),10,colors(idx,:),mark(idx));
end    
%Final means
lastmean = size(means8,1)-k;
scatter(means8(lastmean:lastmean+k,1),means8(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');






%%Question 3 ----------------------------------------------------------
figure;

k=2;
subplot(3,1,1),hold on; 
for idx = 1:k
    scatter(data2(data2(:,3)==idx,1),data2(data2(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means2,1)-k
        plot_arrow(means2(i+(idx-1),1),means2(i+(idx-1),2),means2((idx-1)+i+k,1),means2((idx-1)+i+k,2),...
            'linewidth',2,...
            'color',colors(idx,:),...
            'facecolor',colors(idx,:),...
            'edgecolor',[0 0 0]);
    end
end    
%Final means
lastmean = size(means2,1)-k;
scatter(means2(lastmean:lastmean+k,1),means2(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');
legend({'Class1','','','','','','','Class2'});

k=4;
subplot(3,1,2),hold on; 
for idx = 1:k
    scatter(data4(data4(:,3)==idx,1),data4(data4(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means4,1)-k
        plot_arrow(means4(i+(idx-1),1),means4(i+(idx-1),2),means4((idx-1)+i+k,1),means4((idx-1)+i+k,2),...
            'linewidth',2,...
            'color',colors(idx,:),...
            'facecolor',colors(idx,:),...
            'edgecolor',[0 0 0]);
    end
end    
%Final means
lastmean = size(means4,1)-k;
scatter(means4(lastmean:lastmean+k,1),means4(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');
legend('Class1','Class2')

k=8;
subplot(3,1,3),hold on; 
for idx = 1:k
    scatter(data8(data8(:,3)==idx,1),data8(data8(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means8,1)-k
        plot_arrow(means8(i+(idx-1),1),means8(i+(idx-1),2),means8((idx-1)+i+k,1),means8((idx-1)+i+k,2),...
            'linewidth',2,...
            'color',colors(idx,:),...
            'facecolor',colors(idx,:),...
            'edgecolor',[0 0 0]);
    end
end    
%Final means
lastmean = size(means8,1)-k;
scatter(means8(lastmean:lastmean+k,1),means8(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');
legend('Class1','Class2')




