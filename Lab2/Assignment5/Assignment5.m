%Assignment5
mu1 = [3 5];
Sigma1 = [1 0;0 4];
P1=0.3;

mu2 = [2 1];
Sigma2 = [2 0;0 1];
P2=0.7;

figure
hold on
x1 = -2:.2:6; x2 = -2:.2:10;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu1,Sigma1);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
F = mvnpdf([X1(:) X2(:)],mu2,Sigma2);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([-2 6 -2 10 0 0.2])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');
y1=(( -2/8 +sqrt( (2/8).^2 - 4*(3/8)*(-9.5221+2.20325-x1.^2/4+2*x1) ) )/(3/4));
y2=(( -2/8 -sqrt( (2/8).^2 - 4*(3/8)*(-9.5221+2.20325-x1.^2/4+2*x1) ) )/(3/4));
line(x1,y1,0.2*(1+zeros(1,size(x1,2))),'Color','red')
line(x1,y2,0.2*(1+zeros(1,size(x1,2))),'Color','red')

% fplot(@(x) (( -2/8 +sqrt( (2/8)^2 - 4*(3/8)*(-9.5221-1.4899-x^2/4+2*x) ) )/(3/4)) );