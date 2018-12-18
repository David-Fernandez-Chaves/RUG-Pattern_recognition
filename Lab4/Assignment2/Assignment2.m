%Assignment2
c = imread('cameraman.tif');
figure;
imshow(c);
edges = edge(c, 'canny');
hc = hough(edges);
H = myhough(edges);
imageDiagonal=sqrt(size(c,1)^2+size(c,2)^2)

figure
hold on
subplot(1,2,1),i=imagesc(hc);
xticklabels = -90:20:90;
xticks = linspace(1, size(hc, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
yticklabels = -size(hc,1)/2:50:size(hc,1)/2;
size(hc,1)/2
yticks = linspace(1, size(hc, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))
xlabel('\theta	(degrees)')	
ylabel('\rho')
title('Built-in Accumulator')

subplot(1,2,2),imagesc(H);
xticklabels = -90:20:90;
xticks = linspace(1, size(H, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
yticklabels = -size(H,1)/2:50:size(H,1)/2;
yticks = linspace(1, size(H, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))
xlabel('\theta	(degrees)')	
ylabel('\rho')
title('myHough Accumulator')