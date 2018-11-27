%Assigment 2

%Part1
%Initialize S and D: 1000 normalized HD
S = zeros(1,10000);
D = zeros(1,10000);

%To S
for i = 1:size(S,2)
    %load a random person set
    dataset = load(sprintf('person%02d.mat',randi(20)));    
    a=[dataset.iriscode(randi(size(dataset.iriscode,1)),:);dataset.iriscode(randi(size(dataset.iriscode,1)),:)];
    S(i)=pdist(a,'hamming');    
end

%To D
for i = 1:size(D,2)
    %load a random person set
    n1 = randi(20);
    n2 = randi(20);
    while n2 == n1
        n2 = randi(20);
    end        
    dataset1 = load(sprintf('person%02d.mat',n1)); 
    dataset2 = load(sprintf('person%02d.mat',n2)); 
    a=[dataset1.iriscode(randi(size(dataset1.iriscode,1)),:);dataset2.iriscode(randi(size(dataset2.iriscode,1)),:)];
    D(i)=pdist(a,'hamming');    
end

%Part2
%Question 1
figure; hold on;
hs = histogram(S)
hd = histogram(D)
hs.BinWidth = 0.035;
hd.BinWidth = 0.035;
title('Histrogram of HD of irises')
xlabel('Distance')
ylabel('Ocurrences')
legend('Same person','Different persons')


%Questions 2,3,4,5,6,7
meanS = mean(S)
meanD = mean(D)
varS = var(S)
varD = var(D)

%Question 8,9 degrees of freedom
g=meanD*(1-meanD)/varD

%Question 10 David
base = [0:.0001:1];
normS = normpdf(base,meanS,sqrt(varS));
normD = normpdf(base,meanD,sqrt(varD));
[MS,FS] = mode(S);
scale = FS/max(normS);
plot(base,scale*normS,'LineWidth',2)
plot(base,scale*normD,'LineWidth',2)
legend({'Equal Iris','Normal distribution of same Iris','Different Iris','Normal distribution of different iris'},'Location','northeast');
ylabel('Number of occurrences');
xlabel('Normalised Hamming Distance');

%Question 11
pD = normcdf(base,meanD,sqrt(varD));
%figure
%plot(base,pD)
indexD = find(pD>0.0005,1);
d =indexD/size(base,2)

%Question 12
pS = normcdf(base,meanS,sqrt(varS));
%figure
%plot(base,pS)
falseRejectionRate = 1-pS(indexD)

%Question 13
%1 - 0.7 = 0.3

%Question 14
testperson = load(sprintf('testperson.mat')); 
HD=zeros(1,20);
mask = (testperson.iriscode < 2);
%Apply mask to testPerson
testperson.iriscode = testperson.iriscode(mask);
for i = 1:20
    dataset = load(sprintf('person%02d.mat',i));
    %Apply mask to dataset of person n
    dataset.iriscode = dataset.iriscode(:,mask); 
    for n = 1:20       
      a=[dataset.iriscode(n,:);testperson.iriscode];      
      HD(1,i) = (HD(1,i)+pdist(a,'hamming'))/2;    
    end  
end

[p,person] = min(HD)


%Question 15
p=0.5;
pHD = normcdf(base,p,1/(2*sqrt(size(testperson.iriscode,2))));
pHD(indexD)



