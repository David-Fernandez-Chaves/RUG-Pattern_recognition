%Assigment6

img = imread('dogGrayRipples.png');
I = im2double(I);
f = fft2(I); 


fs= fftshift(f);
f = abs(fs);
f = log(1+f);




imshow(f,[]);

imshow(img)


