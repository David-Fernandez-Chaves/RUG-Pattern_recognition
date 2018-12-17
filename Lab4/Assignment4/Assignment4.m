clc;
close all;

image = im2double(imread('HeadTool0002.bmp'));
imshow(image);
figure;
image_contrast = adapthisteq(image); %stretch-contrast
imshow(image_contrast);
[centers, radiis] = imfindcircles(image_contrast,[20 40],'Sensitivity', 0.93);%find circles
viscircles(centers(:,:),radiis(:,:),'EdgeColor','r'); %all circles found
title('Circles found with 0.93 sensitivity and [20,40] radii range');
figure;
imshow(image_contrast);
viscircles(centers(1:2,:),radiis(1:2,:),'EdgeColor','r');
title('Two strongest circles found with 0.93 sensitivity and [20,40] radii range');%two strongest circles found
