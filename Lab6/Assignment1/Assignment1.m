%% Assignment1
% close all;
load('kmeans1.mat');
[means2,data2] = kmeans2D(kmeans1,2,0);
[means4,data4] = kmeans2D(kmeans1,4,0);
[means8,data8] = kmeans2D(kmeans1,8,0);

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


%% Question 3 ----------------------------------------------------------
figure;

k=2;
subplot(3,1,1),hold on;
legend_class = zeros(k,1);
for idx = 1:k
    scatter(data2(data2(:,3)==idx,1),data2(data2(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means2,1)-k
        arrows = plot_arrow(means2(i+(idx-1),1),means2(i+(idx-1),2),means2((idx-1)+i+k,1),means2((idx-1)+i+k,2),...
            'linewidth',1);
    end
    legend_class(idx) = plot(NaN,NaN,'color',colors(idx,:),'Marker',mark(idx));
end    
%Final means
lastmean = size(means2,1)-k;
scatter(means2(lastmean:lastmean+k,1),means2(lastmean:lastmean+k,2),60,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');
legend(legend_class,{'Class 1','Class 2'});


k=4;
subplot(3,1,2),hold on;
legend_class = zeros(k,1);
for idx = 1:k
    scatter(data4(data4(:,3)==idx,1),data4(data4(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means4,1)-k
        plot_arrow(means4(i+(idx-1),1),means4(i+(idx-1),2),means4((idx-1)+i+k,1),means4((idx-1)+i+k,2),...
            'linewidth',1);
    end
    legend_class(idx) = plot(NaN,NaN,'color',colors(idx,:),'Marker',mark(idx));
end    
%Final means
lastmean = size(means4,1)-k;
scatter(means4(lastmean:lastmean+k,1),means4(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');legend(legend_class,{'Class 1','Class 2','Class 3','Class 4'});


k=8;
subplot(3,1,3),hold on; 
legend_class = zeros(k,1);
for idx = 1:k
    scatter(data8(data8(:,3)==idx,1),data8(data8(:,3)==idx,2),10,colors(idx,:),mark(idx));
    for i=1:k:size(means8,1)-k
        plot_arrow(means8(i+(idx-1),1),means8(i+(idx-1),2),means8((idx-1)+i+k,1),means8((idx-1)+i+k,2),...
            'linewidth',1);
    end
    legend_class(idx) = plot(NaN,NaN,'color',colors(idx,:),'Marker',mark(idx));
end    
%Final means
lastmean = size(means8,1)-k;
scatter(means8(lastmean:lastmean+k,1),means8(lastmean:lastmean+k,2),40,'ks','filled');

xlabel('Feature 1');
ylabel('Feature 2');
legend(legend_class,{'Class 1','Class 2','Class 3','Class 4','Class 5','Class 6','Class 7','Class 8'});


%% Question 4 to 7-------------------------------------------------------

d=2; %dimensionality
runs=20;
ks=20;
R=zeros(ks,runs);
J=zeros(ks,runs);

for r=1:runs
    for k=1:ks
        [means,data,J(k,r)] = kmeans2D(kmeans1,k,0);
        R(k,r)=J(1,r)*k^(-2/d);
    end
end

%% Question 7 ---------------------------------------------------------- 

R=mean(R,2);
J=mean(J,2);
D=R./J;
[~,Kopt]=max(D);

%% Question 4 ----------------------------------------------------------
figure
plot(D)    
axis([1 ks 0 inf])
line([Kopt Kopt],[min(D),max(D)],'Color',[1 0 0])
title('D');
xlabel('K');
ylabel('Value');

%% Question 5 ----------------------------------------------------------
figure 
hold on
plot(J)
plot(R)
axis([1 ks 0 inf])
line([Kopt Kopt],[min(J),max(J)],'Color',[1 0 0])
title('J and R');
legend('J','R','Kopt');
xlabel('K');
ylabel('Value');


%% Question 8 to 13 -----------------------------------------------------

load('checkerboard.mat');
k=100;
runs=20;
series = 10;

quantization_error=zeros(series,runs);
quantization_error_pp=zeros(series,runs);

for s=1:series
    for r=1:runs
        [~,~,quantization_error(s,r)] = kmeans2D(checkerboard,k,0);
        [~,~,quantization_error_pp(s,r)] = kmeans2D(checkerboard,k,1);
    end
end
quantization_error = min(quantization_error');
quantization_error_pp = min(quantization_error_pp');

%Get means and variance
m = mean(quantization_error);
variance = var(quantization_error);
m_pp = mean(quantization_error_pp);
variance_pp = var(quantization_error_pp);

%Welch's t-test

t=(m-m_pp)/sqrt(variance/series +variance_pp/series)






