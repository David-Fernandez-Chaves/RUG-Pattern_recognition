%Assigment1
mu = [5 7];
Sigma = 4;

%Question1
fa=1-normcdf(10,mu(1),Sigma);
h=1-normcdf(10,mu(2),Sigma);

%Question3
d1=abs(5-7)/sqrt(Sigma);
%Question4
d2=abs(5-9)/sqrt(Sigma);

%Question5
u2=3*sqrt(4)+5

%Question7
load('lab3_1','outcomes' );
h = sum(outcomes(:,1) + outcomes(:,2) == 2)/size(outcomes,1);
%Question8
fa=sum(and(outcomes(:,1)==0, outcomes(:,2) == 1))/size(outcomes,1);
%Question9




