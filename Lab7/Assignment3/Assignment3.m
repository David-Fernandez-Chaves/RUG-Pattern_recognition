%Assignment 3

x1=[0;0];
x2=[2;3];
x3=[1;4];
x4=[4;2];
x5=[3;0];

x=[x1 x2 x3 x4 x5]';

c1=[x3 x1  x2 ]';
c2=[x4 x5]';

m1=mean(mean(c1));
m2=mean(mean(c2));

Je=0;

for i=1:size(x,1)
   Je=Je+sum(pow2(x(i)-m1)+pow2(x(i)-m2));
end

Je