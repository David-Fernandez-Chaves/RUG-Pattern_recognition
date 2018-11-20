%Assigment 1
load('lab1_1.mat');
C = cov(lab1_1);
R = corrcoef(lab1_1)

figure;
subplot(2,1,1); scatter(lab1_1(:,3),lab1_1(:,1),'r','filled')
title('Weight with respect to height')
xlabel('Weight (kg)')
ylabel('Height (cm)')

subplot(2,1,2); scatter(lab1_1(:,3),lab1_1(:,2),'g','filled')
title('Weight with respect to the age')
xlabel('Weight (kg)')
ylabel('Age (years)')