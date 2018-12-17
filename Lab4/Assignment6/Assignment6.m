%Assigment6
%Question 1 - show fft
I = imread('dogGrayRipples.png');
I = im2double(I);
f = fft2(I); 


fs= fftshift(f);
f = abs(fs);
f = log(1+f);
figure
imshow(f,[]);

%Question 2
%The upper and lower start shaped spikes indicate a distortion. 

%Question 5 - Get points to filter

[x, y] = getpts;
hold on
plot(x,y,'*')


%Question 4 - Select radio
r=10;

%Question 3 - Creating mask
mask=zeros(size(f));

rows = size(f,1),cols = size(f,2),radius = r,center = [x'; y'];  
[xMat,yMat] = meshgrid(1:cols,1:rows);


for i =1:size(center,2)
    distFromCenter = sqrt((xMat-center(1,i)).^2 + (yMat-center(2,i)).^2);
    mask(distFromCenter<=radius)=1;
end

figure, imshow(~mask,[]);title('Mask')

%question 6 = 166
%question 7 = 120
%question 8 = 166
%question 9 = 180

%Question 10 - Apling mask and Inver fft

fs=fs.*(~mask);

f = ifftshift(fs);

Ir = real(ifft2(f));

%figure, imshow(Ir, []), title('Reconstructed - S3880788');
%figure, imshow(Ir, []), title('Reconstructed - S3836452');

figure, hold on
subplot(2,1,1), imshow(I,[]), title('Initial');
subplot(2,1,2), imshow(Ir, []), title('Reconstructed');

