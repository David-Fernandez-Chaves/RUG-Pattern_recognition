%Assignment3
load('lab3_3_cat1.mat')
load('lab3_3_cat2.mat')
load('lab3_3_cat3.mat')

u=[0.5;1;0];
v=[0.31;1.51;-0.5];
w=[-1.7;-1.7;-1.7];
prior = 1/3;

h=1;
x=v;

%Class1
probability_density=0;
for i=1:10
    probability_density=probability_density+exp(-((x(1)-x_w1(i,1))^2+(x(2)-x_w1(i,2))^2+(x(3)-x_w1(i,3))^2)/(2*h)^2);
end

%Normalization
probability_density = probability_density/(h*sqrt(2*pi))^3;
probability_density1 = probability_density/size(x_w1,1);


%Class2
probability_density=0;
for i=1:10
    probability_density=probability_density+exp(-((x(1)-x_w2(i,1))^2+(x(2)-x_w2(i,2))^2+(x(3)-x_w2(i,3))^2)/(2*h)^2);
end

%Normalization
probability_density = probability_density/(h*sqrt(2*pi))^3;
probability_density2 = probability_density/size(x_w2,1);

%Class3
probability_density=0;
for i=1:10
    probability_density=probability_density+exp(-((x(1)-x_w3(i,1))^2+(x(2)-x_w3(i,2))^2+(x(3)-x_w3(i,3))^2)/(2*h)^2);
end

%Normalization
probability_density = probability_density/(h*sqrt(2*pi))^3;
probability_density3 = probability_density/size(x_w3,1);


posterior1 = (probability_density1*prior);
posterior2 = (probability_density2*prior);
posterior3 = (probability_density3*prior);

posterior1_norm = posterior1/(posterior1+posterior2+posterior3)
posterior2_norm = posterior2/(posterior1+posterior2+posterior3)
posterior3_norm = posterior3/(posterior1+posterior2+posterior3)

datas=[x_w1; x_w2; x_w3];
classes=[1+zeros(size(x_w1,1),1);2+zeros(size(x_w1,1),1);3+zeros(size(x_w1,1),1)];
KNN(x,5,datas,classes)

