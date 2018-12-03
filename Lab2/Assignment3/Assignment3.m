%Assignment 3

mu = [3 4];
Sigma = [ 1 0 ; 0 2];


%Question 1
x1 = 0:.2:6; x2 = 0:.2:8;
[X1,X2] = meshgrid(x1,x2);
F = mvnpdf([X1(:) X2(:)],mu,Sigma);
F = reshape(F,length(x2),length(x1));
surf(x1,x2,F);
caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
axis([0 6 0 8 0 0.2])
xlabel('x1'); ylabel('x2'); zlabel('Probability Density');

%Question 2
Y = [10 10];
X = mvnrnd(mu,Sigma,1000);
d2_mahal = mahal(Y,X)
%Question 3
Y = [0 0];
X = mvnrnd(mu,Sigma,1000);
d2_mahal = mahal(Y,X)
%Question 4
Y = [3 4];
X = mvnrnd(mu,Sigma,1000);
d2_mahal = mahal(Y,X)
%Question 5
Y = [6 8];
X = mvnrnd(mu,Sigma,1000);
d2_mahal = mahal(Y,X)