%Assigment1
mu = [5 7];
Sigma = 4;

%Question1
h=1-normcdf(10,mu(2),Sigma);

%Question2
fa=1-normcdf(10,mu(1),Sigma);


%Question3
d1=abs(5-7)/sqrt(Sigma);
%Question4
d2=abs(5-9)/sqrt(Sigma);

%Question5
u2=3*sqrt(4)+5

%Question7
load('lab3_1','outcomes' );
h = sum(outcomes(:,1) + outcomes(:,2) == 2)/sum(outcomes(:,1)==1);
%Question8
fa=sum(and(outcomes(:,1)==0, outcomes(:,2) == 1))/sum(outcomes(:,1)==0);

%Question9
base = -5:.1:5;

figure
hold on
axis([0 1 0 1])
title('ROC');
xlabel('1-Specificity');
ylabel('Sensitivity');
plot(fa,h,'or')

TruePositive=1-normcdf(base,0,1);

for i=0:5
    FalsePositive=1-normcdf(base,i,1);
    plot(TruePositive,FalsePositive,'-')
end

FalsePositive=1-normcdf(base,2.125,1);
plot(TruePositive,FalsePositive,'-')

legend('Point Question 7 and 8','d=0','d=1','d=2','d=3','d=4','d=5','d=2.125')


