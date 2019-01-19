%Assignment 3

x1=[0;0];
x2=[2;3];
x3=[1;4];
x4=[4;2];
x5=[3;0];

c1=[x3 x5 ];
c2=[x4 x2 x1];

m1=mean(c1,2); %we are working with two dimension
m2=mean(c2,2);
% ATTENTION all only works on 2018b edition
Je = sum((c1-m1).^2,'all'); %since we don't have to submit the code 
Je = Je + sum((c2-m2).^2,'all'); %and is only two clusters

%revise, calculate all distance
x = [x1 x2 x3 x4 x5];
z = pdist(x');
z = squareform(z);
