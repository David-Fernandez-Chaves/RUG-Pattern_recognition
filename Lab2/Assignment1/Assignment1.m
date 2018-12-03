%Assignment1

%Question 1-13
Measurements = [4,6,8,7,4;5,3,7,4,6;6,9,3,8,5];

mu = mean(Measurements')
Sigma = cov(Measurements',1)

%Question 14
base = [5 5 6];
x = mvnpdf(base,mu,Sigma);

%Question 15
base = [3 5 7];
x = mvnpdf(base,mu,Sigma);

%Question 16
base = [4 6.5 1];
x = mvnpdf(base,mu,Sigma);