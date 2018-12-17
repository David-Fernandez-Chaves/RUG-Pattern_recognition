I = rgb2gray(imread('chess.jpg'));
BW = edge(I,'canny');
[H,T,R] = hough(BW);
P = houghpeaks(H,15,'threshold', ceil(0.3*max(H(:))));
x = T(P(:,2));
y = R(P(:,1));
figure;
plot(x,y,'s','color','white');
set(gca,'Color','k');
title('15 Strongest points on the Hough space');

figure;
imshow(I);
for i = 1:size(P,1)
    myhoughline(I,y(i),x(i));
end
title('15 Strongest lines on the image')