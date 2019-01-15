function [prototypes] = batchNG(Data, n, epochs, xdim, ydim)
% Batch Neural Gas
%   Data contains data,
%   n is the number of clusters,
%   epoch the number of iterations,
%   xdim and ydim are the dimensions to be plotted, default xdim=1,ydim=2

error(nargchk(3, 5, nargin));  % check the number of input arguments
if (nargin<4)
  xdim=1; ydim=2;   % default plot values
end

%prototypes init
sbrace = @(x,y)(x{y});
fromfile = @(x)(sbrace(struct2cell(load(x)),1));
prototypes=fromfile('clusterCentroids.mat');
figure;hold on;
plot(Data(:,xdim),Data(:,ydim),'bo','markersize',3)
plot(prototypes(:,xdim),prototypes(:,ydim),'r.','markersize',10,'linewidth',3)
voronoi(prototypes(:,xdim),prototypes(:,ydim))
title('Initial prototypes - Broken algorithm')
figure;
lambda0 = n/2; %initial neighborhood value
% lambda
lambda = lambda0 * (0.01/lambda0).^([0:(epochs-1)]/epochs);
% note: the lecture slides refer to this parameter as sigma^2
%       instead of lambda
ss=1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Action
for i=1:epochs
    %Rank prototype by distance to each points
    [~,D_prototypes] = sort(pdist2(prototypes,Data));
    %Update prototypes
    prototypes = exp(-(D_prototypes/lambda(i)))*Data./sum(exp(-(D_prototypes/lambda(i))),2);
    %Plot
    if ismember(i,[20,100,200,500])   
        subplot(2,2,ss);
        hold on
        plot(Data(:,xdim),Data(:,ydim),'bo','markersize',3)
        plot(prototypes(:,xdim),prototypes(:,ydim),'r.','markersize',10,'linewidth',3)
        % write code to plot decision boundaries
        voronoi(prototypes(:,xdim),prototypes(:,ydim))
        ss=ss+1;
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
