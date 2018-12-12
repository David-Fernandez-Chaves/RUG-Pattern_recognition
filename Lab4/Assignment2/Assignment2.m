%Assignment2
c = imread('cameraman.tif');
edges = edge(c, 'canny');
hc = hough(edges);
H = myhough(edges);
imageDiagonal=sqrt(size(c,1)^2+size(c,2)^2);

figure
hold on
subplot(1,2,1),i=imagesc(hc);
xticklabels = -90:20:90;
xticks = linspace(1, size(hc, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
yticklabels = -imageDiagonal:50:imageDiagonal;
yticks = linspace(1, size(hc, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))
xlabel('\theta	(degrees)')	
ylabel('\rho')	

subplot(1,2,2),imagesc(H);
xticklabels = -90:20:90;
xticks = linspace(1, size(H, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
yticklabels = -imageDiagonal:50:imageDiagonal;
yticks = linspace(1, size(H, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))
xlabel('\theta	(degrees)')	
ylabel('\rho')	