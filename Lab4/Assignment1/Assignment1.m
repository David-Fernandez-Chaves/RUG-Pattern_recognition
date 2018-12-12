%Assigment1

c = imread('cameraman.tif');

edges = edge(c, 'canny');

hc = hough(edges);

%Question3
imageDiagonal=sqrt(size(c,1)^2+size(c,2)^2);
imagesc(hc);
title('S3836452')
xticklabels({-70:20:90})
yticklabels({-imageDiagonal+100:100:imageDiagonal})
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
myhoughline(c,r-imageDiagonal,44)

