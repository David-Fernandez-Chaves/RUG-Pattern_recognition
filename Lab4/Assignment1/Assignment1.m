%Assigment1

c = imread('cameraman.tif');

edges = edge(c, 'canny');

[hc,T,R] = hough(edges);

%Question3
imageDiagonal=sqrt(size(c,1)^2+size(c,2)^2);
imagesc(hc);
%title('S3836452')
title('S3880788')
xticklabels = -90:20:90;
xticks = linspace(1, size(hc, 2), numel(xticklabels));
set(gca, 'XTick', xticks, 'XTickLabel', xticklabels)
yticklabels = -imageDiagonal:50:imageDiagonal;
yticks = linspace(1, size(hc, 1), numel(yticklabels));
set(gca, 'YTick', yticks, 'YTickLabel', flipud(yticklabels(:)))
xlabel('\theta	(degrees)')	
ylabel('\rho')		

%Question4
hcTh = hc;
hcTh(hcTh < 0.999 * max(hc(:))) = 0;
imagesc(hcTh)

%Question5
[H,T,R] = hough(edges);
P  = houghpeaks(hc,5);
imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
plot(T(P(:,2)),R(P(:,1)),'s','color','white');
title('Houghpeaks')

%Question7
[r theta] = find(hcTh,max(max(hcTh)))
figure
hold on
imshow(c)
myhoughline(c,r-imageDiagonal,theta-91)
%title('S3836452')
title('S3880788')

%Con ayuda de matlab
lines = houghlines(c,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(c), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
